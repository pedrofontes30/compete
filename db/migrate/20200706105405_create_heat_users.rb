class CreateHeatUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :heat_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :heat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
