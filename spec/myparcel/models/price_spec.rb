require 'spec_helper'

describe Myparcel::Models::Price do
  describe 'attributes' do

    subject(:price) { described_class.new amount: 500, currency: 'EUR' }

    describe '#amount' do
      it 'defines correct method' do
        expect(price.amount).to eq 500
      end
    end

    describe '#currency' do
      it 'defines correct method' do
        expect(price.currency).to eq 'EUR'
      end
    end
  end
end
