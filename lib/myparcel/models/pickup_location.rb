module Myparcel
  module Models
    class PickupLocation
      include Virtus.model

      attribute :package_type,      Integer
      attribute :delivery_type,     Integer
      attribute :delivery_date,     DateTime
      attribute :delivery_remark,   String
      attribute :only_recipient,    Boolean
      attribute :signature,         Boolean
      attribute :return,            Boolean
      attribute :insurance,         Price
      attribute :large_format,      Boolean
      attribute :label_description, String
    end
  end
end
