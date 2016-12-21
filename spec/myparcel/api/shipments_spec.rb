require 'spec_helper'

describe Myparcel::API::Shipments do
  let(:authentication) { Myparcel::Authentication.new('71f9ff822bff0b71afb35c011cb8bc8650d4ba19') }
  let(:shipments) { described_class.new(authentication) }

  describe '#all' do
    it 'is an alias for #find' do
      shipments.should_receive(:find)
      shipments.all
    end
  end

  describe '#find' do
    context 'all' do
      let(:found_shipments) { shipments.find }

      it 'finds all shipments' do
        VCR.use_cassette :shipments do
          found_shipments.count.should eql 21
        end
      end

      it 'each element is a shipment' do
        VCR.use_cassette :shipments do
          found_shipments[0]['barcode'].should be_nil
          found_shipments[0].keys.should include 'barcode'
          found_shipments[0]['id'].should eql 18_567_773
          found_shipments[1]['id'].should eql 18_567_775
        end
      end
    end

    context 'with id' do
      let(:found_shipments) { shipments.find :shipment_ids => [18_567_773, 18_567_775] }

      it 'finds shipments by ids' do
        VCR.use_cassette :shipments_by_ids do
          found_shipments.size.should eql 2
          found_shipments[0]['id'].should eql 18_567_773
          found_shipments[1]['id'].should eql 18_567_775
        end
      end
    end

    context 'with option' do
      describe 'q' do
        it 'searches shipment objects by given value' do
          VCR.use_cassette :shipments_by_option do
            shipments.find(:query => { :q => '575' }).size.should eql 5 # 575 is price amount
          end
        end
      end

      describe 'dropoff_today' do
        it 'gets shipments with dropoff_today set to true' do
          VCR.use_cassette :shipments_dropoff_today do
            shipments.find(:query => { :dropoff_today => 1 }).size.should eql 21
          end
        end
      end

      describe 'status' do
        it 'gets shipments with status' do
          VCR.use_cassette :shipments_status do
            shipments.find(:query => { :status => 2 }).size.should eql 0
          end
        end
      end
    end
  end

  describe '#create' do
    let(:shipment_hash) do
      {
        :recipient => {
          :cc => 'NL',
          :postal_code => '9999XX',
          :city => 'Amsterdam',
          :street => 'Hoofdstraat',
          :number => '1',
          :person => 'John Doe'
        },
        :carrier => 1,
        :options => {
          :package_type => 1
        },
        :status => 1
      }
    end

    context 'creating single shipment' do
      let(:created_shipments) { shipments.create :shipments => [shipment_hash] }

      it 'creates one shipment' do
        VCR.use_cassette :shipments_create_single_payment, :match_requests_on => [:body] do
          created_shipments.should eql [{ 'id' => 20_126_870 }]
        end
      end
    end

    context 'creating multiple shipments' do
      let(:created_shipments) { shipments.create :shipments => [shipment_hash, shipment_hash] }

      it 'creates one shipment' do
        VCR.use_cassette :shipments_create_multiple_shipments, :match_requests_on => [:body] do
          created_shipments.should eql [{ 'id' => 20_126_871 }, { 'id' => 20_126_872 }]
        end
      end
    end
  end

  describe '#delete' do
    it 'raises if options[:shipment_ids] is empty' do
      expect { shipments.delete }.to raise_error 'options[:shipment_ids] cannot be empty or nil'
    end

    it 'removes shipments' do
      VCR.use_cassette :shipments_delete do
        shipments.delete(:shipment_ids => [20_126_871])
      end

      VCR.use_cassette :shipments_find_deleted do
        shipments.find(:shipment_ids => [20_126_871]).should be_empty
      end
    end
  end
end
