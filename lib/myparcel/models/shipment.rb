module Myparcel
  module Models
    # Defines a Shipment sobject
    class Shipment
      include Virtus.model

      attribute :recipient,           Myparcel::Models::Address
      attribute :recipients,          [Integer]
      # attribute :pickup,              Myparcel::Models::PickupLocation
      # attribute :options,             Myparcel::Models::ShipmentOptions
      # attribute :customs_declaration, Myparcel::Models::CustomsDeclaration
      # attribute :carrier,             Myparcel::Models::Carrier
      # attribute :physical_properties, Myparcel::Models::PhysicalProperties
      # attribute :status,              Myparcel::Models::ShipmentStatus
      # attribute :parent,              Integer
      # attribute :general_settings,    Myparcel::Models::ShipmentGeneralSettings
      # attribute :price,               Myparcel::Models::Price
      # attribute :barcode,             String
      # attribute :sender,              Myparcel::Models::Address
      # attribute :created,             DateTime
      # attribute :modified,            DateTime
    end
  end
end
