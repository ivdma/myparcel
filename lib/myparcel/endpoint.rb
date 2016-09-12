module Myparcel
  # Base structure for enpoints
  class Endpoint < ActiveInteraction::Base
    string :api_key, default: -> { ENV['MYPARCEL_API_KEY'] }

    def url
      ['https://api.myparcel.nl', endpoint].join('/')
    end

    def encoded_api_key
      Base64.urlsafe_encode64(api_key, padding: false)
    end

    def headers
      { 'Authorization' => encoded_api_key }
    end
  end
end
