class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :async
  after_filter do
    Thread.new { AsyncCache.instance.build }
  end
end
