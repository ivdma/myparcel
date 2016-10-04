module Myparcel
  module Models
    # Defines UnrelatedReturnShipment
    class UnrelatedReturnShipment
      include Virtus.model

      attribute :shop_id, Integer
      attribute :carrier, String
      attribute :email, String
      attribute :name, String
      attribute :options, Myparcel::Models::ShipmentOptions
    end
  end
end
