require 'spec_helper'

describe Myparcel::Models::ShipmentGeneralSettings do
  describe 'attributes' do
    subject(:custom_object) do
      described_class.new \
        save_recipient_address: true,
        delivery_notification: true,
        delivery_notification_email: ['foo@bar.com']
    end

    describe '#save_recipient_address' do
      it 'defines correct method' do
        expect(custom_object.save_recipient_address).to eq true
      end
    end

    describe '#delivery_notification' do
      it 'defines correct method' do
        expect(custom_object.delivery_notification).to eq true
      end
    end

    describe '#delivery_notification_email' do
      it 'defines correct method' do
        expect(custom_object.delivery_notification_email).to eq ['foo@bar.com']
      end
    end
  end
end
