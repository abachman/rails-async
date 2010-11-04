module AsyncHelper
  def asynchronously
    id = Time.new.to_i
    id = "#{ id }#{ AsyncCache.instance.counter }"

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
    
    AsyncCache.instance.schedule do
      # anything rendered within capture will be stored in _content
      _content = capture do
        yield
      end
      AsyncCache.instance.write(id, _content)
    end
  end
end
