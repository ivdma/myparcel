module Myparcel
  module API
    # Class for managing tracktraces
    class Tracktraces < Myparcel::API::Base
      def find(options = {})
        shipment_ids = options.fetch(:shipment_ids, [])
        raise 'options[:shipment_ids] cannot be empty' if shipment_ids.empty?
        shipment_ids = shipment_ids.join(';')
        full_path = [path, shipment_ids].join('/')
        response = request :get, full_path, options
        response['data']['tracktraces']
      end

      def path
        'tracktraces'
      end
    end
  end
end
