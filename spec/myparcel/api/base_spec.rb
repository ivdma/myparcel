require 'spec_helper'

describe Myparcel::API::Base do
  let(:authentication) { Myparcel::Authentication.new('foo') }

  subject(:base) { described_class.new(authentication) }

  describe '#headers_for_shipment' do
    it 'returns correct header for standard shipment' do
      expect(base.send(:headers_for_shipment, :standard)).to eq 'application/vnd.shipment+json; charset=utf-8'
    end
  end
end
