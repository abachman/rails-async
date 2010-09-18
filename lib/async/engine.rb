require 'rails'
require 'async'

puts "ENGINE UP"

module Async
  class Engine < Rails::Engine
    engine_name :async
  end
end
