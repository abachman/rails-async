puts "MODEL"
class AsyncCache
  def self.read(tag)
    @content = nil
    status = Timeout.timeout(2) do 
      until File.exists?(path(tag))
        sleep 0.2
      end
      @content = File.read(path(tag))
    end
    Rails.logger.debug("Returned from timeout with status #{ status.inspect }")

    @content
  end

  def self.write(tag, content)
    if !File.exists?(parent)
      setup
    end

    File.open(path(tag), 'w') do |f|
      f.write(content)
    end
  end

private 
  def self.setup
    FileUtils.mkdir_p parent
  end

  def self.parent
    File.join(Rails.root, "tmp", "async")
  end

  def self.path tag
    File.join(parent, tag.to_s)
  end
end

