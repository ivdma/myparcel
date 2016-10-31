module Myparcel
  module API
    # Class for getting delivery options
    class DeliveryOptions < Myparcel::API::Base
      def find(options = {})
        request_options = {}
        request_options[:query] = options
        response = request :get, 'delivery_options', request_options
        response['data']['delivery']
      end
    end
  end
end
