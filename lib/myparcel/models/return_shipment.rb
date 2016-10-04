require 'myparcel/models/shipment_options'

module Myparcel
  module Models
    # Return Shipment object
    class ReturnShipment
      include Virtus.model

      attribute :shop_id, Integer
      attribute :parent, Integer
      attribute :carrier, String
      attribute :email, String
      attribute :name, String
      attribute :options, Myparcel::Models::ShipmentOptions
    end
  end
end
