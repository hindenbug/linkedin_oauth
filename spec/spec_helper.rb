require(File.expand_path('../../lib/linkedin_oauth', __FILE__))

require 'rspec'
require 'webmock/rspec'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/linkedin_cassette'
  c.stub_with :webmock
  c.ignore_localhost = true
  c.default_cassette_options = { :record => :none }
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end