class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :yr
      t.decimal :mpg

      t.timestamps
    end
  end
end
