require 'spec_helper'

describe Myparcel::Authentication do
  subject(:authentication) { described_class.new }

  before do
    allow(ENV).to receive(:[]).with('MYPARCEL_API_KEY').and_return('foo')
  end

  describe 'initialization' do
    it 'uses provided api key' do
      authentication = described_class.new('bar')
      expect(authentication.api_key).to eq 'bar'
    end

    it 'alls back to env var' do
      expect(authentication.api_key).to eq 'foo'
    end
  end

  describe '#headers' do
    it 'uses auth_token to create auth header' do
      expect(authentication.headers).to eq 'Authorization' => "basic #{authentication.auth_token}"
    end
  end

  describe '#auth_token' do
    it 'makes encoded token' do
      expect(authentication.auth_token).to eq Base64.urlsafe_encode64('foo')
    end
  end

  describe '#valid?' do
    it 'is true when key is present' do
      expect(authentication.valid?).to eq true
    end

    it 'is false when key is absent' do
      allow(ENV).to receive(:[]).with('MYPARCEL_API_KEY').and_return(nil)
      expect(authentication.valid?).to eq false
    end
  end

  describe '#invalid?' do
    it 'is true when key is absent' do
      allow(ENV).to receive(:[]).with('MYPARCEL_API_KEY').and_return(nil)
      expect(authentication.invalid?).to eq true
    end

    it 'is true when key is present' do
      expect(authentication.invalid?).to eq false
    end
  end
end
