require 'spec_helper'

describe Myparcel::API::Shipments do
  let(:authentication) { Myparcel::Authentication.new('71f9ff822bff0b71afb35c011cb8bc8650d4ba19') }

  subject(:shipments) { described_class.new(authentication) }

  describe '#all' do
    it 'is an alias for #find' do
      expect(shipments).to receive(:find)
      shipments.all
    end
  end

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

    context 'by option' do
      describe 'q' do
        it 'searches shipment objects by given value' do
          VCR.use_cassette :shipments do
            expect(shipments.find(query: { q: '575' }).size).to eq 2 # 575 is price amount
          end
        end
      end

      describe 'dropoff_today' do
        it 'gets shipments with dropoff_today set to true' do
          VCR.use_cassette :shipments do
            expect(shipments.find(query: { dropoff_today: 1 }).size).to eq 17
          end
        end
      end

      describe 'status' do
        it 'gets shipments with status' do
          VCR.use_cassette :shipments do
            expect(shipments.find(query: { status: 2 }).size).to eq 0
          end
        end
      end
    end
  end

  describe '#create' do
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
  end

  describe '#delete' do
    it 'raises if options[:shipment_ids] is empty' do
      expect { shipments.delete }.to raise_error 'options[:shipment_ids] cannot be empty or nil'
    end

    it 'removes shipments' do
      VCR.use_cassette :shipments do
        shipments.delete(shipment_ids: [18_923_677])
        expect(shipments.find(shipment_ids: [18_923_677])).to be_empty
      end
    end
  end
end
