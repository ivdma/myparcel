require 'spec_helper'

describe Myparcel::Models::UnrelatedReturnShipment do
  describe 'attributes' do
    subject(:unrelated_return_shipment) do
      described_class.new \
        shop_id: 1,
        carrier: 'Foo',
        email: 'foo@bar.com',
        name: 'bar',
        options: nil
    end

    describe '#shop_id' do
      it 'initiates correct value' do
        expect(unrelated_return_shipment.shop_id).to eq 1
      end
    end

    describe '#carrier' do
      it 'initiates correct value' do
        expect(unrelated_return_shipment.carrier).to eq 'Foo'
      end
    end

    describe '#email' do
      it 'initiates correct value' do
        expect(unrelated_return_shipment.email).to eq 'foo@bar.com'
      end
    end

    describe '#name' do
      it 'initiates correct value' do
        expect(unrelated_return_shipment.name).to eq 'bar'
      end
    end

    describe '#options' do
      it 'initiates correct value' do
        expect(unrelated_return_shipment.options).to eq nil
      end
    end
  end
end
