require 'spec_helper'

describe Myparcel::API::Shipments do
  let(:authentication) { Myparcel::Authentication.new('71f9ff822bff0b71afb35c011cb8bc8650d4ba19') }

  subject(:shipments) { described_class.new(authentication) }

  describe '#find' do
    context 'all' do
      let(:found_shipments) { shipments.find }

      it 'finds all shipments' do
        VCR.use_cassette :shipments do
          expect(found_shipments.count).to eq 15
        end
      end

      it 'each element is a shipment' do
        VCR.use_cassette :shipments do
          expect(found_shipments[0]['barcode']).to be_nil
          expect(found_shipments[0].keys).to include 'barcode'
          expect(found_shipments[0]['id']).to eq 18_567_773
          expect(found_shipments[1]['id']).to eq 18_567_775
        end
      end
    end

    context 'by id' do
      let(:found_shipments) { shipments.find shipment_ids: [18_567_773, 18_567_775] }

      it 'finds shipments by ids' do
        VCR.use_cassette :shipments do
          expect(found_shipments.size).to eq 2
          expect(found_shipments[0]['id']).to eq 18_567_773
          expect(found_shipments[1]['id']).to eq 18_567_775
        end
      end
    end
  end

  describe '#create' do
    subject(:shipments) { described_class.new(authentication) }

    let(:shipment_hash) do
      {
        recipient: {
          cc: 'NL',
          postal_code: '9999XX',
          city: 'Amsterdam',
          street: 'Hoofdstraat',
          number: '1',
          person: 'John Doe'
        },
        carrier: 1,
        options: {
          package_type: 1
        },
        status: 1
      }
    end

    context 'creating single shipment' do
      let(:created_shipments) { shipments.create shipments: [shipment_hash] }

      it 'creates one shipment' do
        VCR.use_cassette :shipments, match_requests_on: [:body] do
          expect(created_shipments).to eq [{ 'id' => 18_923_480 }]
        end
      end
    end

    context 'creating multiple shipments' do
      let(:created_shipments) { shipments.create shipments: [shipment_hash, shipment_hash] }

      it 'creates one shipment' do
        VCR.use_cassette :shipments, match_requests_on: [:body] do
          expect(created_shipments).to eq [{ 'id' => 18_923_677 }, { 'id' => 18_923_678 }]
        end
      end
    end

    describe '#headers_for_shipment' do
      it 'returns correct header for standard shipment' do
        expect(shipments.headers_for_shipment(:standard)).to eq 'application/vnd.shipment+json; charset=utf-8'
      end
    end
  end
end