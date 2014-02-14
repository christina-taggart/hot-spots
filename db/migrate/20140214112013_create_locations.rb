class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, :longitude, :lattitude
      t.timestamps
    end
  end
end
