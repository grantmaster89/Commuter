class AddPlacesToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :start_place_id, :integer
    add_column :trips, :end_place_id, :integer
    end
end
