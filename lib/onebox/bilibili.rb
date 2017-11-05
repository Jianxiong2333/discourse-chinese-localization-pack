module Onebox
  module Engine
    class BilibiliOnebox
      include Engine
      include HTML

      matches_regexp(/^https?:\/\/(?:www\.)?bilibili\.com\/video\/([a-z0-9]+)\/?$/)

      # Try to get the video ID. Works for URLs of the form:
      # * http://www.bilibili.com/video/av4235068/
      def video_id
        match = uri.path.match(/\/video\/av(\d+)(\.html)?.*/)
        return match[1] if match && match[1]

        nil
      rescue
        return nil
      end

      def to_html
        '<iframe src="https://www.bilibili.com/html/html5player.html?aid=10022527&cid=16565382&as_wide=1" frameborder="0" width="820" height="430" allowfullscreen></iframe>'
      end

      def placeholder_html
        to_html
      end
    end
  end
end
