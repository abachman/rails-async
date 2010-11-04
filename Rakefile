ENV['BUNDLE_GEMFILE'] = File.dirname(__FILE__) + '/test/rails_root/Gemfile'

require 'rubygems'
require 'rake'

require 'rake/testtask'
namespace :test do
  Rake::TestTask.new(:basic => ["generator:cleanup", 
                                "generator:async"]) do |test|
    test.libs << 'lib' 
    test.libs << 'test'
    test.pattern = 'test/test_*.rb'
    test.verbose = true
  end
end

namespace :generator do 
  task :cleanup do
  end

  task :async do
    system "cd test/rails_root && bundle install"
  end
end

task :default => 'test:basic'

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rails-async #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.rdoc_files.include('app/**/*.rb')
end
