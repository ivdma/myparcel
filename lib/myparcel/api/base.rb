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

        req = get_request_object(method, uri, options[:query] || {})
        headers = authentication.headers.update(options[:headers] || {})

        headers.each do |k, v|
          req.add_field(k, v) unless v.nil?
        end

        req.body = options[:body] || ''

        res = http.request(req)
        case res.code.to_i
        when 200..201
          res.body == '' || res.body.nil? ? '' : JSON.parse(res.body)
        when 422
          raise "Unprocessable entity for `#{method} #{url}` with #{options.inspect}."
        else
          raise 'Something went wrong'
        end
      end

      def query_params(params)
        params.map do |k, v|
          "#{k}=#{CGI.escape(v.to_s)}"
        end.join('&')
      end

      def get_request_object(method, uri, params)
        path = "#{uri.path}?#{query_params(params)}"
        case method
        when :get
          Net::HTTP::Get.new(path)
        when :post
          Net::HTTP::Post.new(path)
        when :delete
          Net::HTTP::Delete.new(path)
        else
          raise 'Not support http method'
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
