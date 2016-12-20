module Myparcel
  # Creates authentication headers
  class Authentication
    attr_accessor :api_key

    def initialize(api_key = ENV['MYPARCEL_API_KEY'])
      @api_key = api_key
    end

    def headers
      { 'Authorization' => "basic #{auth_token}" }
    end

    def auth_token
      Base64.encode64(api_key).delete("\n")
    end

    # Could have used api_key.present? but
    # it wasn't avavailable in 1.9.3 yet for Object nor for String
    def valid?
      !api_key.nil? && !api_key.empty?
    end

    def invalid?
      !valid?
    end

    def host
      'https://api.myparcel.nl'
    end
  end
end
