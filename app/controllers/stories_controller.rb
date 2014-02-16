class StoriesController < ApplicationController
  before_action(:load_user)
  before_action(:load_story, { only: [:show, :edit, :update, :destroy] })

  def index
    @stories = Story.all
  end

  def new
 @user = User.find(session[:user_id])
 @story = @user.stories.new
    render(:new)
  end

  def create
    @user = User.find(session[:user_id])
    @user.stories.new(story_params)
    
    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end


  def show
    @story = Story.find(params[:id])
    # binding.pry
    @pics = instagram_tag(@story.hashtag)
    @tag_count = instagram_tag_stat(@story.hashtag).to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
    @pics_info = instagram_photos(@story.hashtag)

  end

  def edit
  end

  def update
    @story.update(story_params)
    redirect_to stories_path
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end


  private

  def load_user
    return @user = User.find(session[:user_id])
  end

  def load_story
    return @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:hashtag, :the_story, :photo_url)
  end


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