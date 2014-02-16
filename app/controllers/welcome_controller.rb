class WelcomeController < ApplicationController
  
  def index
    @stories = Story.all
  end

private

  def instagram_tag(tag)
    iae = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=8a67c3b89c51484ea8f6ac75de2bdc01")
    picture_index = (0..19).to_a
    saved_pictures = []
    picture_index.each { | picture | saved_pictures << iae["data"][picture]["images"]["standard_resolution"]["url"] }
    return saved_pictures
  end

  def instagram_photos(tag)
    iae = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=8a67c3b89c51484ea8f6ac75de2bdc01")
    saved_pictures = iae["data"]
    return saved_pictures
  end


  def instagram_tag_stat(tag)
    tag_stats = HTTParty.get("https://api.instagram.com/v1/tags/search?q=#{tag}&client_id=8a67c3b89c51484ea8f6ac75de2bdc01")
    tag_count = tag_stats["data"][0]["media_count"]
    
    return tag_count

  end
end