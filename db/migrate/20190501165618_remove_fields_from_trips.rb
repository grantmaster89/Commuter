class RemoveFieldsFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :start_latitude
    remove_column :trips, :start_longitude
    remove_column :trips, :end_latitude
    remove_column :trips, :end_longitude
  end
end
