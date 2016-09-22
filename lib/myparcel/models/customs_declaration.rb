module Myparcel
  module Models
    # Defines Customs Declaration Object
    class CustomsDeclaration
      include Virtus.model

      attribute :contents, PackageContents
      attribute :invoice, String
      attribute :weight, Integer
      attribute :items, Array # Array[CustomItem]
    end
  end
end
