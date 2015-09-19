title = "#{@user.first_name} #{@user.last_name} soundbits feed"
author = "#{@user.first_name} #{@user.last_name} feed"
description = "Selections you have added from soundbits"
keywords = "soundbits"

if params[:ipod]
  title += " (Mobile)"
  description += " This version is for mobile devices which cannot support the full resolution version."
  keywords += ', mobile'
  image = "http://railscasts.com/images/ipod_railscasts_cover.jpg"
  ext = 'm4v'
else
  description += " This is the full resolution version, a lower reoslution for mobile devices is also available."
  image = "http://railscasts.com/images/railscasts_cover.jpg"
  ext = 'mp4'
end

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title "#{@user.first_name} #{@user.last_name} feed"
    xml.link 'http://soundbits.com'
    xml.description description
    xml.language 'en'
    xml.pubDate @pubDate
    xml.lastBuildDate @pubDate
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'soundbits@soundbits.com'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Podcasts' do
      xml.itunes :category, :text => 'Curated podcasts'
    end
    xml.itunes :category, :text => 'Podcasts' do
      xml.itunes :category, :text => 'podcasts'
    end

    @episodes.each do  |episode|
      xml.item do
        xml.title episode.full_name
        xml.description episode.description
        xml.pubDate episode.created_at.to_s(:rfc822)
        xml.enclosure :url => episode.audio_url, :length => episode.audio_length, :type => 'audio/mpeg'
        xml.link episode.audio_url
        xml.guid({:isPermaLink => "false"}, "")
        xml.itunes :author, author
        xml.itunes :subtitle, truncate(episode.description, :length => 150)
        xml.itunes :summary, episode.description
        xml.itunes :explicit, 'no'
        xml.itunes :duration, episode.episode_duration
      end
    end
  end
end
