module Myparcel
  module API
    # Class for getting shipment labels
    class ShipmentLabels < Myparcel::API::Base
      def request_labels(options = {})
        shipment_ids = options.fetch(:shipment_ids, [])
        shipment_ids = shipment_ids.join(';') if shipment_ids.is_a?(Array)

        full_path = shipment_ids.empty? ? path : [path, shipment_ids]
        request :get, full_path, {}
      end

      def path
        'shipment_labels'
      end
    end
  end
end
