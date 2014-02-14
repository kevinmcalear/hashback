class Story < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :user
  validates :hashtag, presence: true
  validates :the_story, presence: true
  validates :photo_url, presence: true
end