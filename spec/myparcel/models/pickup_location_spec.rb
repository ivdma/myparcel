require 'spec_helper'

describe Myparcel::Models::PickupLocation do
  let(:price) { Myparcel::Models::Price.new(amount: 100, currency: 'USD') }
  let(:datetime) { DateTime.new }

  describe 'attributes' do
    subject(:custom_object) do
      described_class.new \
        package_type: 1,
        delivery_type: 1,
        delivery_date: datetime,
        delivery_remark: 'foo',
        only_recipient: true,
        signature: true,
        return: true,
        insurance: price,
        large_format: true,
        label_description: 'bar'
    end

    describe '#package_type' do
      it 'defines correct method' do
        expect(custom_object.package_type).to eq 1
      end
    end

    describe '#delivery_type' do
      it 'defines correct method' do
        expect(custom_object.delivery_type).to eq 1
      end
    end

    describe '#delivery_date' do
      it 'defines correct method' do
        expect(custom_object.delivery_date).to eq datetime
      end
    end

    describe '#delivery_remark' do
      it 'defines correct method' do
        expect(custom_object.delivery_remark).to eq 'foo'
      end
    end

    describe '#only_recipient' do
      it 'defines correct method' do
        expect(custom_object.only_recipient).to eq true
      end
    end

    describe '#signature' do
      it 'defines correct method' do
        expect(custom_object.signature).to eq true
      end
    end

    describe '#return' do
      it 'defines correct method' do
        expect(custom_object.return).to eq true
      end
    end

    describe '#insurance' do
      it 'defines correct method' do
        expect(custom_object.insurance).to eq Myparcel::Models::Price.new(amount: 100, currency: 'USD')
      end
    end

    describe '#large_format' do
      it 'defines correct method' do
        expect(custom_object.large_format).to eq true
      end
    end

    describe '#label_description' do
      it 'defines correct method' do
        expect(custom_object.label_description).to eq 'bar'
      end
    end
  end
end
