require 'spec_helper'

describe Myparcel::API::WebhookSubscriptions do
  let(:authentication) { Myparcel::Authentication.new('71f9ff822bff0b71afb35c011cb8bc8650d4ba19') }
  let(:webhooks) { described_class.new(authentication) }

  describe '#find' do
    it 'raises if subscription_ids are empty' do
      expect { webhooks.find }.to raise_error ArgumentError, 'options[:subscription_ids] cannot be empty'
    end

    it 'fetches webhooks' do
      VCR.use_cassette :webhook_subscriptions_find, :record => :new_episodes do
        subscriptions = webhooks.find(:subscription_ids => [955])
        subscriptions[0]['account_id'].should eql 104_343
        subscriptions[0]['shop_id'].should eql 13_812
      end
    end
  end

  describe '#create' do
    let(:subscriptions) do
      [{ :hook => 'shipment_status_change', :url => 'https://seoshop.nl/myparcel/notifications' }]
    end

    it 'creates a webhook subscription' do
      VCR.use_cassette :webhook_subscriptions_create do
        webhooks.create(:subscriptions => subscriptions).should eql [{ 'id' => 955 }]
      end
    end
  end
end
