require 'spec_helper'

describe Myparcel::ListShipments do
  let(:api_key) { '71f9ff822bff0b71afb35c011cb8bc8650d4ba19' }

  subject { described_class.run(api_key: api_key) }

  describe '#encoded_api_key' do
    it 'returns encoded api_key' do
      expect(subject.encoded_api_key).to eq Base64.urlsafe_encode64(api_key, padding: false)
    end
  end

  describe 'endpoint' do
    it 'gets a list of shipments' do
      expect(subject.result).to be_an Array
    end

    it 'gets a list of demanded shipments'
  end
end
