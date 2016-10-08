module Myparcel
  # List shipments
  class ListShipments < Endpoint
    array :shipment_ids, default: []

    def execute
      data[endpoint].map do |shipment|
        Myparcel::Models::Shipment.new(shipment)
      end
    end

    def endpoint
      'shipments'
    end

    def ids
      shipment_ids.map(&:to_s).join(';') if shipment_ids.any?
    end
  end
end
