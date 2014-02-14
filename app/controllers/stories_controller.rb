class StoriesController < ApplicationController
  before_action(:load_user)
  before_action(:load_story, { only: [:show, :edit, :update, :destroy] })

  def index
    @stories = Story.all
  end

  def new
 @user = User.find(params[:user_id])
 @story = @user.stories.new
    render(:new)
  end

  def create
    @user.stories.new(story_params)
    
    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end


  def show
    @story = @user.story.all
  end

  def edit
  end

  def update
    @story.update(artist_params)
    redirect_to artists_path
  end

  def destroy
    @story.destroy
    redirect_to artists_path
  end


  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def load_story
    return @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:hashtag, :the_story, :photo_url)
  end
end