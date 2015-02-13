require "bundler/gem_tasks"
require 'rspec/core/rake_task'

load "tasks/ddr_filetools.rake"

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
