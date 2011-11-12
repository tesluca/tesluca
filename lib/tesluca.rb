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
    
    def self.connect_to_cassandra(rack_env)
      config = YAML.load_file(ROOT_PATH + "/config/cassandra.yml")[rack_env]
      ActiveColumn.connect(config)
    end
    
    get "/" do
      "ok" 
    end
  end
end
