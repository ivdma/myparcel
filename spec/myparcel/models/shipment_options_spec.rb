require 'spec_helper'

describe Myparcel::Models::ShipmentOptions do
  describe 'attributes' do
    subject(:shipment_options) do
      described_class.new \
        package_type: 1,
        delivery_type: 2,
        delivery_date: Time.now,
        delivery_remark: 'foo',
        only_recipient: true,
        signature: true,
        return: true,
        insurance: 1,
        large_format: true,
        label_description: 'bar'
    end

    describe '#package_type' do
      it 'sets correct value' do
        expect(shipment_options.package_type).to eq 1
      end
    end

    describe '#delivery_type' do
      it 'sets correct value' do
        expect(shipment_options.delivery_type).to eq 2
      end
    end

    describe '#delivery_date' do
      it 'sets correct value' do
        Timecop.freeze do
          expect(shipment_options.delivery_date).to eq Time.now
        end
      end
    end

    describe '#delivery_remark' do
      it 'sets correct value' do
        expect(shipment_options.delivery_remark).to eq 'foo'
      end
    end

    describe '#only_recipient' do
      it 'sets correct value' do
        expect(shipment_options.only_recipient).to eq true
      end
    end

    describe '#signature' do
      it 'sets correct value' do
        expect(shipment_options.signature).to eq true
      end
    end

    describe '#return' do
      it 'sets correct value' do
        expect(shipment_options.return).to eq true
      end
    end

    describe '#insurance' do
      it 'sets correct value' do
        expect(shipment_options.insurance).to eq 1
      end
    end

    describe '#large_format' do
      it 'sets correct value' do
        expect(shipment_options.large_format).to eq true
      end
    end

    describe '#label_description' do
      it 'sets correct value' do
        expect(shipment_options.label_description).to eq 'bar'
      end
    end
  end
end
