class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :instagram_username, presence: true
  validates :profile_picture_url, presence: true
 has_secure_password
end