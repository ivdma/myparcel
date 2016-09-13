module Myparcel
  module Models
    # A custom object
    class CustomObject
      include Virtus.model

      attribute :description,    String
      attribute :amount,         Integer
      attribute :weight,         Integer
      attribute :item_value,     Myparcel::Models::Price
      attribute :classification, String
      attribute :country,        String
    end
  end
end
