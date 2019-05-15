class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.references :origin
      t.references :destination
      t.float :distance

      t.timestamps
    end
  end
end
