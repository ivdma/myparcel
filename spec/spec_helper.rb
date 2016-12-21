$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'myparcel'
require 'webmock'
require 'vcr'
require 'dotenv'

Dotenv.load

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
  config.allow_http_connections_when_no_cassette = false
end
