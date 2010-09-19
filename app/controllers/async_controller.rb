puts "CONTROLLER"
class AsyncController < ApplicationController
  def show
    @as_cache = AsyncCache.read(params[:tag])
    render :json => {:content => @as_cache}
  end
end
