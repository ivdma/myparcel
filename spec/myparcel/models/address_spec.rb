require 'spec_helper'

describe Myparcel::Models::Address do
  describe 'attributes' do
    subject(:address) do
      described_class.new \
        cc: 'NL',
        postal_code: '2131BC',
        city: 'Amsterdam',
        street: 'Dorpsstraat',
        number: 18,
        number_suffix: 'a',
        person: 'John Doe',
        company: 'Some Company',
        email: 'john@example.com',
        phone: '0612345678'
    end

    describe '#cc' do
      it 'defines correct method' do
        expect(address.cc).to eq 'NL'
      end
    end

    describe '#postal_code' do
      it 'defines correct method' do
        expect(address.postal_code).to eq '2131BC'
      end
    end

    describe '#city' do
      it 'defines correct method' do
        expect(address.city).to eq 'Amsterdam'
      end
    end

    describe '#street' do
      it 'defines correct method' do
        expect(address.street).to eq 'Dorpsstraat'
      end
    end

    describe '#street_additional_info' do
      it 'defines correct method' do
        expect(address.street_additional_info).to eq nil
      end
    end

    describe '#number' do
      it 'defines correct method' do
        expect(address.number).to eq 18
      end
    end

    describe '#number_suffix' do
      it 'defines correct method' do
        expect(address.number_suffix).to eq 'a'
      end
    end

    describe '#person' do
      it 'defines correct method' do
        expect(address.person).to eq 'John Doe'
      end
    end

    describe '#company' do
      it 'defines correct method' do
        expect(address.company).to eq 'Some Company'
      end
    end

    describe '#email' do
      it 'defines correct method' do
        expect(address.email).to eq 'john@example.com'
      end
    end

    describe '#phone' do
      it 'defines correct method' do
        expect(address.phone).to eq '0612345678'
      end
    end
  end
end
