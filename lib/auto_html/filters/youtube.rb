AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil) do |text, options|
  regex = /(https?:\/\/)?(www\.|m\.)?(youtube\.com\/(\#\/)?watch\?(.*)?v=|youtube\.com\/watch\?v=|youtu\.be\/)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
  text.gsub(regex) do
    youtube_id = $6
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
		wmode = options[:wmode]
		src = "//www.youtube.com/embed/#{youtube_id}"
		src += "?wmode=#{wmode}" if wmode
    %{<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end

