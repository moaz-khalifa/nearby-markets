module Spree
  class Market < Spree::Base
    validates_presence_of :name, :address

    geocoded_by :address
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  end
end
