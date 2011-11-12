# require 'bundler'
require 'sinatra'
require 'cassandra/1.0'
require 'active_column'
require "tesluca/version"
require "tesluca/action_log"
require "active_support"

module Tesluca
  class App < Sinatra::Base
    ROOT_PATH = File.expand_path(File.dirname(__FILE__) + "/..")
    
    def connect_to_cassandra(rack_env)
      @client = Cassandra.new('tesluca_test', '127.0.0.1:9160')
    end
    
    get "/" do
      "ok" 
    end
  end
end
