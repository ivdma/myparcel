module Myparcel
  module Models
    # Defines Customs Declaration Object
    class CustomsDeclaration
      include Virtus.model

      attribute :contents, String
      attribute :invoice, String
      attribute :weight, Integer
      attribute :items, Array[Myparcel::Models::CustomsItem]
    end
  end
end
