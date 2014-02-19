class UsersController < ApplicationController
  
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new

    render(:new)
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
    @stories = @user.stories.all
    hash_count = []
    @stories.each {|story| hash_count << instagram_tag_stat(story.hashtag).to_i}
    @instagram = instagram_info(@user.instagram_username)
    @total_hash_count = hash_count.reduce(:+).to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
  end

  def edit
    @update_worked = true
  end

  def update
    @update_worked = @user.update(user_params)
    
    if @update_worked
      redirect_to user_path(@user)
    else
      render(:edit)
    end
  end

  def destroy
    @user.destroy
    session.destroy
    redirect_to root_path
  end

  private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params

    params.require(:user).permit(:email, :first_name, :last_name, :dob, :instagram_username, :profile_picture_url, :phone_number, :password, :password_confirmation)
  end

  def instagram_info(user_name)
    profile = HTTParty.get( "https://api.instagram.com/v1/users/search?q=#{user_name}&client_id=#{INSTAGRAM_CLIENT_ID}")
    profile_info = profile["data"][0]
    return profile_info
  end

  def instagram_tag_stat(tag)
    tag_stats = HTTParty.get("https://api.instagram.com/v1/tags/search?q=#{tag}&client_id=#{INSTAGRAM_CLIENT_ID}")
    tag_count = tag_stats["data"][0]["media_count"]
    return tag_count
  end
end