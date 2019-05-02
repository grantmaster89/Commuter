class AddQuantityToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :quantity, :integer, default: 1
  end
end
