require 'spec_helper'

describe Myparcel::Client do
  describe 'initialization' do
    context 'with api key' do
      it 'instantiates with authentication' do
        client = described_class.new('foo')
        client.authentication.should be_a Myparcel::Authentication
      end
    end

    context 'without api key' do
      it 'raises exception' do
        expect { described_class.new }.to raise_error 'No credentials provided'
      end
    end
  end

  describe '#delivery_options' do
    let(:client) { described_class.new('foo') }

    it 'is an instance of delivery_options' do
      client.delivery_options.should be_a Myparcel::API::DeliveryOptions
    end
  end

  describe '#shipments' do
    let(:client) { described_class.new('foo') }

    it 'is an instance of shipments' do
      client.shipments.should be_a Myparcel::API::Shipments
    end
  end

  describe '#tracktraces' do
    let(:client) { described_class.new('foo') }

    it 'is an instance of tracktraces' do
      client.tracktraces.should be_a Myparcel::API::Tracktraces
    end
  end

  describe '#webhooks' do
    let(:client) { described_class.new('foo') }

    it 'is an instance of webhooks' do
      client.webhooks.should be_a Myparcel::API::WebhookSubscriptions
    end
  end
end
