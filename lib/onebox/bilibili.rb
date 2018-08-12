module Onebox
  module Engine
    class BilibiliOnebox
      include Engine
      include HTML

      matches_regexp(/^https?:\/\/(?:www\.)?bilibili\.com\/video\/av(\d+)\/?.*$/)

      # Try to get the video ID. Works for URLs of the form:
      # * http://www.bilibili.com/video/av4235068/?cid16565382
      def video_id
        match = uri.path.match(/\/video\/av(\d+)\/?.*$/)
        return match[1] if match && match[1]

        nil
      rescue
        return nil
      end

      def get_cid
        match = uri.query.match(/cid(\d+)/)
        return match[1] if match && match[1]

        nil
      rescue
        return nil
      end

      def to_html
        vid = self.video_id
        cid = self.get_cid
        "<iframe src='https://www.bilibili.com/html/player.html?aid=#{vid}&cid=#{cid}&as_wide=0' frameborder='0' width='820' height='430' allowfullscreen></iframe>"
      end

      def placeholder_html
        to_html
      end
    end
  end
end
