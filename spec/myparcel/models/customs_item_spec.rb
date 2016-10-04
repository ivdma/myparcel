require 'spec_helper'

describe Myparcel::Models::CustomsItem do
  let(:price) { Myparcel::Models::Price.new(amount: 100, currency: 'USD') }

  describe 'attributes' do
    subject(:custom_object) do
      described_class.new \
        description: 'foo',
        amount: 100,
        weight: 200,
        item_value: price,
        classification: 'bar',
        country: 'NL'
    end

    describe '#description' do
      it 'defines correct method' do
        expect(custom_object.description).to eq 'foo'
      end
    end

    describe '#amount' do
      it 'defines correct method' do
        expect(custom_object.amount).to eq 100
      end
    end

    describe '#weight' do
      it 'defines correct method' do
        expect(custom_object.weight).to eq 200
      end
    end

    describe '#item_value' do
      it 'defines correct method' do
        expect(custom_object.item_value).to eq price
      end
    end

    describe '#classification' do
      it 'defines correct method' do
        expect(custom_object.classification).to eq 'bar'
      end
    end

    describe '#country' do
      it 'defines correct method' do
        expect(custom_object.country).to eq 'NL'
      end
    end
  end
end
