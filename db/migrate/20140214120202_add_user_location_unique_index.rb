class AddUserLocationUniqueIndex < ActiveRecord::Migration
  def change
    add_index :location_users, [:user_id, :location_id], unique: true
    add_index :users, :email, unique: true
    add_index :locations, [:longitude, :lattitude], unique: true
  end
end
