$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'myparcel'
require 'webmock'
require 'vcr'
require 'timecop'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
end

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.after(:each) do
    Timecop.return
  end
end
