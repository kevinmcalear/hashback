class Photo < ActiveRecord::Base
  belongs_to :story
  validates :photo_id, presence: true
  validates :photo_url, presence: true
  validates :likes_count, presence: true
  validates :title, presence: true
  validates :created_time, presence: true
  validates :username, presence: true
end