require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require 'rake/testtask'

task :default => [:spec]

Rake::TestTask.new(:spec) do |t|
  t.test_files = FileList["spec/**/*_spec.rb"] 
end

