class CreateCompetitionDivisions < ActiveRecord::Migration[6.0]
  def change
    create_table :competition_divisions do |t|
      t.references :competition, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true

      t.timestamps
    end
  end
end
