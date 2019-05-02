class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :place, foreign_key: true
      t.belongs_to :trip, foreign_key: true

      t.timestamps
    end
  end
end
