require 'helper'
MiniTest::Unit.autorun

describe AsyncCache do
  before do
    @async_cache = AsyncCache.instance
  end
  
  describe "when blocks are added" do
    it "should increment counter" do 
      @async_cache.counter.must_equal 0
      @async_cache.schedule { puts "hello world" }
      @async_cache.counter.must_equal 1
    end
  end
end
