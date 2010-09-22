puts "HELPER"
module AsyncHelper
  def asynchronously
    id = Time.new.to_i
    id = id.to_s + rand(10000)

    # insert javascript callback
    safe_concat %{
      <div id="#{id}">
        Loading... #{ image_tag('spinner.gif') }
      </div>
      <script>
        $(function () {
          $.getJSON(
            "/async/#{id}", 
            function (data) {
              $('##{id}').html(data.content)
            }
          );
        }); 
      </script>
    }

    connection = ActiveRecord::Base.remove_connection
    child = Process.fork do 
      begin
        ActiveRecord::Base.establish_connection((connection || {}).merge({:allow_concurrency => true})) if defined?(ActiveRecord)
        # anything rendered within capture will be stored in _content
        _content = capture do
          yield
        end
        AsyncCache.write(id, _content)
      ensure
        ActiveRecord::Base.remove_connection
      end 
    end
  ensure
    ActiveRecord::Base.establish_connection((connection || {}).merge({:allow_concurrency => true}))
  end
end
