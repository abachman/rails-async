class AsyncController < ApplicationController
  def show
    @as_cache = AsyncCache.instance.read(params[:tag])
    render :json => {:content => @as_cache}
  end
end
