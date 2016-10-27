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
        httparty_options = {
          query: options.fetch(:query, {}),
          body: options.fetch(:body, ''),
          headers: authentication.headers.update(options[:headers] || {})
        }
        response = HTTParty.send method, url, httparty_options

        case response.code
        when 200..201
          response
        when 422
          raise "Unprocessable entity for `#{method} #{url}` with #{httparty_options}."
        else
          raise response
        end
      end
    end
  end
end
