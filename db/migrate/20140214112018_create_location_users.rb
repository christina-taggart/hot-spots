class CreateLocationUsers < ActiveRecord::Migration
  def change
    create_table :location_users do |t|
      t.integer :user_id, :location_id
      t.boolean :has_visited, default: false
      t.timestamps
    end
  end
end
