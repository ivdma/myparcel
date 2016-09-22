module Myparcel
  module Models
    class ShipmentGeneralSettings
      include Virtus.model

      attribute :save_recipient_address, Boolean
      attribute :delivery_notification, Boolean
      attribute :delivery_notification_email, Array
    end
  end
end
