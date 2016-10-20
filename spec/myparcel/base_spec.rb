require 'spec_helper'

describe Myparcel::Base do
  let(:authentication) { Myparcel::Authentication.new('foo') }

  subject(:base) { described_class.new(authentication) }

  describe '#headers' do
    it 'is equal to authentications headers' do
      expect(base.headers).to eq authentication.headers
    end
  end
end
