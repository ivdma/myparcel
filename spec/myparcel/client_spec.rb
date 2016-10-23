require 'spec_helper'

describe Myparcel::Client do
  describe 'initialization' do
    context 'with api key' do
      it 'instantiates with authentication' do
        client = described_class.new('foo')
        expect(client.authentication).to be_a Myparcel::Authentication
      end
    end

    context 'without api key' do
      it 'raises exception' do
        expect { described_class.new }.to raise_error 'No credentials provided'
      end
    end
  end

  describe '#shipments' do
    subject(:client) { described_class.new('foo') }

    it 'is an instance of shipments' do
      expect(client.shipments).to be_a Myparcel::Shipments
    end
  end
end
