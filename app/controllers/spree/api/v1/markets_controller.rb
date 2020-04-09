module Spree
	module Api
    module V1
			class MarketsController < Spree::Api::BaseController
				def index
					ip = Rails.env.production? ? request.remote_ip : Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
					coordinates = Geocoder.coordinates(ip)
					markets = Spree::Market.near(coordinates, 5, units: :km)
					render json: markets
				end
			end
		end
	end
end
