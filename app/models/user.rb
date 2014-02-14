require 'bcrypt'

class User < ActiveRecord::Base
  has_many :location_users
  has_many :locations, through: :location_users
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
