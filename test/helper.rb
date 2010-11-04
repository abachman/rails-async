ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) +
                         "/rails_root/config/environment")
require 'rails/test_help'

require 'minitest/spec'
begin
  require 'redgreen'
rescue LoadError
end

$: << File.expand_path(File.dirname(__FILE__) + '/..')
require 'async'
