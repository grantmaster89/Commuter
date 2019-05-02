class AddColumnsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :street, :string
    add_column :places, :city, :string
    add_column :places, :zip, :string
    add_column :places, :state, :string
  end
end
