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

  describe '#delivery_options' do
    subject(:client) { described_class.new('foo') }

    it 'is an instance of delivery_options' do
      expect(client.delivery_options).to be_a Myparcel::API::DeliveryOptions
    end
  end

  describe '#shipments' do
    subject(:client) { described_class.new('foo') }

    it 'is an instance of shipments' do
      expect(client.shipments).to be_a Myparcel::API::Shipments
    end
  end

  describe '#tracktraces' do
    subject(:client) { described_class.new('foo') }

    it 'is an instance of tracktraces' do
      expect(client.tracktraces).to be_a Myparcel::API::Tracktraces
    end
  end

  describe '#webhooks' do
    subject(:client) { described_class.new('foo') }

    it 'is an instance of webhooks' do
      expect(client.webhooks).to be_a Myparcel::API::WebhookSubscriptions
    end
  end
end
