puts "CONTROLLER"
class AsyncController < ApplicationController
  unloadable 

  def show
    @as_cache = AsyncCache.read(params[:tag])
    render :json => {:content => @as_cache}
  end
end
