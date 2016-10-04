require 'spec_helper'

describe Myparcel::Models::ReturnShipment do
  let(:options) { Myparcel::Models::ShipmentOptions.new }

  describe 'attributes' do
    subject(:return_shipment) do
      described_class.new \
        shop_id: 1,
        parent: 1,
        carrier: '',
        email: '',
        name: '',
        options: options
    end

    describe '#shop_id' do
      it 'returns correct value' do
        expect(return_shipment.shop_id).to eq 1
      end
    end

    describe '#parent' do
      it 'returns correct value' do
        expect(return_shipment.parent).to eq 1
      end
    end

    describe '#carrier' do
      it 'returns correct value' do
        expect(return_shipment.carrier).to eq ''
      end
    end

    describe '#mail' do
      it 'returns correct value' do
        expect(return_shipment.email).to eq ''
      end
    end

    describe '#name' do
      it 'returns correct value' do
        expect(return_shipment.name).to eq ''
      end
    end

    describe '#options' do
      it 'returns correct value' do
        expect(return_shipment.options).to eq options
      end
    end
  end
end
