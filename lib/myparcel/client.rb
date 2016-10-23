module Myparcel
  # Represents a client for the API
  class Client
    attr_accessor :authentication

    def initialize(api_key = nil)
      @authentication = Myparcel::Authentication.new(api_key)
      raise 'No credentials provided' if @authentication.invalid?
    end

    def shipments
      @shipments ||= Myparcel::Shipments.new(authentication)
    end
  end
end
