class User < ActiveRecord::Base
  has_many :location_users
  has_many :locations, through: :location_users
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
end
