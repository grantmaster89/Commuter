class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.decimal :start_latitude
      t.decimal :start_longitude
      t.decimal :end_latitude
      t.decimal :end_longitude

      t.timestamps
    end
  end
end
