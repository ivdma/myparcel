module Myparcel
  class Authentication
    def headers
      { 'Authorization' => "basic #{auth_token}" }
    end

    def auth_token
      Base64.urlsafe_encode64(api_key)
    end

    def api_key
      ENV['MYPARCEL_API_KEY'] || ''
    end

    def valid?
      api_key.present?
    end

    def invalid?
      !valid?
    end
  end
end
