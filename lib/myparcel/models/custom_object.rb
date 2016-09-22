module Myparcel
  module Models
    # Defines a Custom Object
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
