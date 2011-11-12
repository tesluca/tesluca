require 'rubygems'
require 'bundler/setup'
# require 'minitest/autorun'
require 'rake/testtask'
require 'rake'
include Rake::DSL
require 'active_column'
task :default => [:spec]

Rake::TestTask.new(:spec) do |t|
  t.test_files = FileList["spec/**/*_spec.rb"] 
end

