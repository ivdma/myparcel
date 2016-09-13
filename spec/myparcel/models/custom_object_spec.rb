require 'spec_helper'

describe Myparcel::Models::CustomObject do
  describe 'attributes' do

    subject(:custom_object) do
      described_class.new \
        description: 'Foo',
        amount: 1,
        weight: 500,
        item_value: { amount: 500, currency: 'EUR' },
        classification: '1',
        country: 'NL'
    end

    describe '#description' do
      it 'defines correct method' do
        expect(custom_object.description).to eq 'Foo'
      end
    end

    describe '#amount' do
      it 'defines correct method' do
        expect(custom_object.amount).to eq 1
      end
    end

    describe '#weight' do
      it 'defines correct method' do
        expect(custom_object.weight).to eq 500
      end
    end

    describe '#item_value' do
      it 'defines correct method' do
        expect(custom_object.item_value.amount).to eq 500
        expect(custom_object.item_value.currency).to eq 'EUR'
      end
    end

    describe '#classification' do
      it 'defines correct method' do
        expect(custom_object.classification).to eq '1'
      end
    end

    describe '#country' do
      it 'defines correct method' do
        expect(custom_object.country).to eq 'NL'
      end
    end
  end
end
