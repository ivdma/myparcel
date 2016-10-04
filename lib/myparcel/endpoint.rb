module Myparcel
  # Base structure for enpoints
  class Endpoint < ActiveInteraction::Base
    string :api_key, default: -> { ENV['MYPARCEL_API_KEY'] }
  end
end
