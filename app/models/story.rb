class Story < ActiveRecord::Base
  belongs_to :user
  validates :hashtag, presence: true
  validates :the_story, presence: true
  validates :photo_url, presence: true
end