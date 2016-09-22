module Myparcel
  module Models
    # Defines Address Object
    class Address
      include Virtus.model

      attribute :cc,                     String
      attribute :postal_code,            String
      attribute :city,                   String
      attribute :street,                 String
      attribute :street_additional_info, String
      attribute :number,                 Integer
      attribute :number_suffix,          String
      attribute :person,                 String
      attribute :company,                String
      attribute :email,                  String
      attribute :phone,                  String
    end
  end
end
