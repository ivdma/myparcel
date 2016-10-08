require 'spec_helper'

describe Myparcel::ListShipments do
  describe '#url' do
    it 'generates a correct URL' do
      expect(described_class.new.url).to eq 'https://api.myparcel.nl/shipments'
    end
  end

  describe '#execute' do
    subject do
      described_class.run api_key: '71f9ff822bff0b71afb35c011cb8bc8650d4ba19'
    end

    it 'returns an array' do
      expect(subject.result).to be_an Array
    end

    it 'array exist of shipments' do
      expect(subject.result.first).to be_an Myparcel::Models::Shipment
    end

    it 'parses recipient' do
      expect(subject.result.first.recipient).to be_an Myparcel::Models::Address
    end

    it 'parses sender' do
      expect(subject.result.first.sender).to be_an Myparcel::Models::Address
    end

    it 'parses shipment options' do
      expect(subject.result.first.options).to be_an Myparcel::Models::ShipmentOptions
    end

    context 'multiple ids' do
      subject do
        described_class.run shipment_ids: [18_567_773, 18_567_777], api_key: '71f9ff822bff0b71afb35c011cb8bc8650d4ba19'
      end

      it 'returns two shipments' do
        expect(subject.result.size).to eq 2
      end
    end
  end
end
