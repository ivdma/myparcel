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
      Base64.urlsafe_encode64(api_key)
    end

    def valid?
      api_key.present?
    end

    def invalid?
      !valid?
    end
  end
end
