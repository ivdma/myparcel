module Myparcel
  module Models
    # Defines Price object
    #
    # == Params:
    #
    # @param amount [Integer] Amount of price in cents.
    # @param currency [String] Currency of the price.
    class Price
      include Virtus.model

      attribute :amount,   Integer
      attribute :currency, String
    end
  end
end
