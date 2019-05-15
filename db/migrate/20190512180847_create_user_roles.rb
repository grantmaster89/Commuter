class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
