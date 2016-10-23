module Myparcel
  # Class for getting shipments
  class Shipments < Myparcel::Base
    def initialize(authentication)
      super
      @path = 'shipments'
    end

    def all
      get
    end

    def find(ids = [])
      get ids: ids
    end
  end
end
