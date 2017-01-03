require 'simplecov'
SimpleCov.start

ENV['FLICKR_API_KEY'] = 'API_KEY'
ENV['FLICKR_SHARED_SECRET'] = 'SECRET'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'etfc'

require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
end
