class CreateHeats < ActiveRecord::Migration[6.0]
  def change
    create_table :heats do |t|
      t.references :competition_division, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :round

      t.timestamps
    end
  end
end
