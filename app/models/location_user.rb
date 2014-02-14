class LocationUser < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :location
  validates :user_id, presence: true
  validates :location_id, presence: true
  validates_uniqueness_of :location_id, scope: :user_id
end
