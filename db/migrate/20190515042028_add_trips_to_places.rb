class AddTripsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :places, :trips_origin
    add_reference :places, :trips_destination
  end
end
