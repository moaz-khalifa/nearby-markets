module Spree
	module Api
    module V1
			class MarketsController < Spree::Api::BaseController
				def index
					ip = Rails.env.production? ? request.remote_ip : Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
					coordinates = Geocoder.coordinates(ip)
					dist = 5000
					type = 'grocery_or_supermarket'
					markets = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=#{ENV['GOOGLE_API_KEY']}&location=#{coordinates.join(',')}&radius=#{dist}&type=#{type}"))
					render json: JSON.parse(markets)['results']
				end
			end
		end
	end
end
