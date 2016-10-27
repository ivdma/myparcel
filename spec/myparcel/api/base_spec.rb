require 'spec_helper'

describe Myparcel::API::Base do
  let(:authentication) { Myparcel::Authentication.new('foo') }

  subject(:base) { described_class.new(authentication) }
end
