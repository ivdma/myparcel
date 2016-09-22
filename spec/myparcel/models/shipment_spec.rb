require 'spec_helper'

describe Myparcel::Models::Shipment do
  describe 'attributes' do
    subject(:shipment) do
      described_class.new \
        recipient: { street: 'Foo', number: 1 }
    end

    describe '#recipient' do
      it 'is an Address' do
        expect(shipment.recipient).to be_a Myparcel::Models::Address
      end

      it 'defines correct attributes' do
        expect(shipment.recipient.street).to eq 'Foo'
        expect(shipment.recipient.number).to eq 1
      end
    end

    describe '#recipients' do
      it 'is an Array of Address#ids' do
        expect(shipment.recipients).to be_a Array
      end
    end
  end
end
