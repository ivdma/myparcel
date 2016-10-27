module Myparcel
  module API
    # Class for getting shipments
    class Shipments < Myparcel::API::Base
      def find(options = {})
        shipment_ids = options.fetch(:shipment_ids, [])
        shipment_ids = shipment_ids.join(';') if shipment_ids.is_a?(Array)

        full_path = shipment_ids.empty? ? path : [path, shipment_ids].join('/')

        response = request :get, full_path, options
        response['data']['shipments']
      end

      def create(options = {})
        shipment_type = options.fetch(:shipment_type, :standard)
        shipments = options.fetch(:shipments, [])
        raise 'options[:shipments] must have at least one shipment.' if shipments.empty?

        options[:headers] ||= {}
        options[:headers]['Content-Type'] = headers_for_shipment(shipment_type)

        options[:body] ||= {}
        options[:body] = JSON.generate(data: { shipments: shipments })

        response = request :post, path, options
        response['data']['ids']
      end

      def delete(options = {})
        shipment_ids = options.fetch :shipment_ids, []
        raise 'options[:shipment_ids] cannot be empty or nil' if shipment_ids.empty?

        shipment_ids = shipment_ids.join(';')
        full_path = [path, shipment_ids].join('/')

        response = request :delete, full_path, options
        response['data']
      end

      def headers_for_shipment(type)
        case type
        when :standard then 'application/vnd.shipment+json; charset=utf-8'
        when :return then 'application/vnd.return_shipment+json; charset=utf-8'
        when :unrelated then 'application/vnd.unrelated_return_shipment+json; charset=utf-8'
        else 'application/vnd.shipment+json; charset=utf-8'
        end
      end

      def path
        'shipments'
      end
    end
  end
end
