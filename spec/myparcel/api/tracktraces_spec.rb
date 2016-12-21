require 'spec_helper'

describe Myparcel::API::Tracktraces do
  let(:authentication) { Myparcel::Authentication.new('71f9ff822bff0b71afb35c011cb8bc8650d4ba19') }
  let(:tracktraces) { described_class.new(authentication) }

  describe '#find' do
    context 'all tracktraces' do
      it 'returns tracktraces' do
        VCR.use_cassette :tracktraces, :record => :new_episodes do
          # Can't simulate tracktraces, so just testing it returns at least an empty array.
          tracktraces.find(:shipment_ids => [18_567_773]).first.should eql []
        end
      end
    end
  end
end
