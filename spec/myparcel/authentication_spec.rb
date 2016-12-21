require 'spec_helper'

describe Myparcel::Authentication do
  let(:authentication) { described_class.new }

  before do
    ENV.stub(:[]).with('MYPARCEL_API_KEY').and_return('foo')
  end

  describe 'initialization' do
    it 'uses provided api key' do
      authentication = described_class.new('bar')
      authentication.api_key.should eql 'bar'
    end

    it 'alls back to env var' do
      authentication.api_key.should eql 'foo'
    end
  end

  describe '#headers' do
    it 'uses auth_token to create auth header' do
      authentication.headers.should eql 'Authorization' => "basic #{authentication.auth_token}"
    end
  end

  describe '#auth_token' do
    it 'makes encoded token' do
      authentication.auth_token.should eql Base64.encode64('foo').delete("\n")
    end
  end

  describe '#valid?' do
    it 'is true when key is present' do
      authentication.valid?.should be_true
    end

    it 'is false when key is absent' do
      ENV.should_receive(:[]).with('MYPARCEL_API_KEY').and_return(nil)
      authentication.valid?.should be_false
    end
  end

  describe '#invalid?' do
    it 'is true when key is absent' do
      ENV.should_receive(:[]).with('MYPARCEL_API_KEY').and_return(nil)
      authentication.invalid?.should be_true
    end

    it 'is true when key is present' do
      authentication.invalid?.should be_false
    end
  end

  describe '#host' do
    it 'has a hostname' do
      authentication.host.should eql 'https://api.myparcel.nl'
    end
  end
end
