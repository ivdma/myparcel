module Myparcel
  module API
    # Class for getting delivery options
    class DeliveryOptions < Myparcel::API::Base
      def find(options = {})
        response = request :get, 'delivery_options', options
        response['data']['delivery']
      end
    end
  end
end
