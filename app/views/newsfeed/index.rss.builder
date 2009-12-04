xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "All Newsfeeds"
    xml.description "My Fantastic Newsfeeds"
    xml.link courses_url

    for feed in @newsfeeds
      xml.item do
        xml.title feed.message
        xml.pubDate feed.created_at
        xml.link root_url
      end
    end
  end
end
