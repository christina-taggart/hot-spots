class Location < ActiveRecord::Base
  # Remember to create a migration!
  has_many :location_users
  has_many :users, through: :location_users
  validates :name, presence: true
  validates :longitude, presence: true
  validates :lattitude, presence: true
  validates_uniqueness_of :longitude, :scope => :lattitude
end
