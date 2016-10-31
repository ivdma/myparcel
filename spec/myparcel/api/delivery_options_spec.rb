require 'spec_helper'

describe Myparcel::API::DeliveryOptions do
  let(:authentication) { Myparcel::Authentication.new('71f9ff822bff0b71afb35c011cb8bc8650d4ba19') }

  subject(:delivery_options) { described_class.new(authentication) }

  describe '#find' do
    it 'finds delivery options' do
      VCR.use_cassette :delivery_options do
        delivery_options.find cc: 'NL', postal_code: '2131bc', number: 679, carrier: 'postnl'
      end
    end
  end
end
