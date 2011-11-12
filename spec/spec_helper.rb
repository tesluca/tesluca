SPEC_ROOT = File.expand_path(File.dirname(__FILE__))
require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require SPEC_ROOT + '/../lib/tesluca.rb'
ENV['RACK_ENV'] = 'test'
require 'rack/test'
# require 'minitest'
require 'minitest/spec'
require 'ap'

include Rack::Test::Methods
set :environment, :test

MiniTest::Spec.add_setup_hook do
  client = Cassandra.new('tesluca_test', '127.0.0.1:9160')
  client.clear_column_family! "action_logs"
end

def app
  # parse_file returns an array, but we need a rack app
  Rack::Builder.parse_file(SPEC_ROOT + '/../config.ru').first
end

