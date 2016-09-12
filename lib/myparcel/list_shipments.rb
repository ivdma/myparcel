module Myparcel
  # Get all shipments
  class ListShipments < Endpoint
    def execute
      response = HTTParty.get url, headers: headers
      results = JSON.parse(response.body)
      results['data'][endpoint]
    end

    def endpoint
      'shipments'
    end
  end
end
