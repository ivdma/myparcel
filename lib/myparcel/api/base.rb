module Myparcel
  module API
    # Base class for all endpoints
    class Base
      attr_accessor :path
      attr_reader :authentication

      def initialize(authentication)
        @authentication = authentication
      end

      protected

      def request(method, path, options = {})
        url = [authentication.host, path].join '/'
        uri = URI.parse(url)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        case method
        when :get
          req = Net::HTTP::Get.new(uri.path)
        when :post
          req = Net::HTTP::Post.new(uri.path)
        when :delete
          req = Net::HTTP::Delete.new(uri.path)
        else
          raise 'Not support http method'
        end

        headers = authentication.headers.update(options[:headers] || {})

        puts headers.inspect

        req.add_field('Authorization', headers['Authorization']) unless headers['Authorization']

        puts req.to_s

        res = http.request(req)

        puts res.body

        case res.code
        when 200..201
          response
        when 422
          raise "Unprocessable entity for `#{method} #{url}` with #{options}."
        else
          raise 'Something went wrong'
        end
      end

      def headers_for_shipment(type)
        case type
        when :standard then 'application/vnd.shipment+json; charset=utf-8'
        when :return then 'application/vnd.return_shipment+json; charset=utf-8'
        when :unrelated then 'application/vnd.unrelated_return_shipment+json; charset=utf-8'
        else 'application/vnd.shipment+json; charset=utf-8'
        end
      end
    end
  end
end
