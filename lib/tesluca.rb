require 'sinatra'
require "tesluca/version"

module Tesluca
  class App < Sinatra::Base
    get "/" do
      "ok" 
    end
  end
end
