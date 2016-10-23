require 'spec_helper'

describe Myparcel::Shipments do
  let(:authentication) { Myparcel::Authentication.new('71f9ff822bff0b71afb35c011cb8bc8650d4ba19') }

  describe '#all' do
    subject(:shipments) { described_class.new(authentication) }

    it 'gets all shipments' do
      VCR.use_cassette :shipments do
        expect(shipments.all.count).to eq 15
      end
    end

    it 'each element is a shipment' do
      all_shipments = nil

      VCR.use_cassette :shipments do
        all_shipments = shipments.all
      end

      expect(all_shipments[0]['barcode']).to be_nil
      expect(all_shipments[0].keys).to include 'barcode'
      expect(all_shipments[0]['id']).to eq 18_567_773
      expect(all_shipments[1]['id']).to eq 18_567_775
    end
  end

  describe '#find' do
    subject(:shipments) { described_class.new(authentication) }

    it 'finds shipments by ids' do
      all_shipments = {}

      VCR.use_cassette :shipments do
        all_shipments = shipments.find [18_567_773, 18_567_775]
      end

      expect(all_shipments.size).to eq 2
      expect(all_shipments[0]['id']).to eq 18_567_773
      expect(all_shipments[1]['id']).to eq 18_567_775
    end
  end
end
