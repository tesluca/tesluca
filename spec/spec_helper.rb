SPEC_ROOT = File.expand_path(File.dirname(__FILE__))
require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require SPEC_ROOT + '/../lib/tesluca.rb'
ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'minitest/spec'
include Rack::Test::Methods

def app
  # parse_file returns an array, but we need a rack app
  Rack::Builder.parse_file(SPEC_ROOT + '/../config.ru').first
end

