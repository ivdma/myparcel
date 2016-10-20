module Myparcel
  # Base class for all endpoints
  class Base
    attr_accessor :headers

    def initialize(authentication)
      @headers = authentication.headers
    end
  end
end
