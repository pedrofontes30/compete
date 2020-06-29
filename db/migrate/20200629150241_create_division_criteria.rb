class CreateDivisionCriteria < ActiveRecord::Migration[6.0]
  def change
    create_table :division_criteria do |t|
      t.references :division, null: false, foreign_key: true
      t.references :criterium, null: false, foreign_key: true
      t.integer :min
      t.integer :max
      t.string :description

      t.timestamps
    end
  end
end
