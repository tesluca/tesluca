require 'rubygems'
require 'bundler'
Bundler.require
require './lib/tesluca.rb'

Tesluca.connect_to_cassandra
run Tesluca::App

