class AsyncCache
  include Singleton

  def initialize
    @@counter = 0
    @@chunks = []
  end

  def schedule(&block)
    @@counter += 1
    @@chunks << block
  end

  def counter
    @@counter
  end

  def build
    @@chunks.each {|chunk| chunk.call }
  end

  # since the async controller read request happens immediately on pages
  # that use the `asynchronously do` block, the AsyncCache#read method 
  # has to block until the file it's looking for exists.
  def read(tag)
    @content = nil
    begin
      status = Timeout.timeout(10) do 
        until File.exists?(path(tag))
          sleep 0.2
        end
        @content = File.read(path(tag))
      end
    rescue Timeout::Error
      Rails.logger.error("\e[31mTimeout Error in AsyncCache\e[0m")
      @content = ""
    end

    @content
  end

  def write(tag, content)
    if !File.exists?(parent)
      setup
    end

    File.open(path(tag), 'w') do |f|
      f.write(content)
    end
  end

private 
  def setup
    FileUtils.mkdir_p parent
  end

  def parent
    File.join(Rails.root, "tmp", "async")
  end

  def path tag
    File.join(parent, tag.to_s)
  end
end

