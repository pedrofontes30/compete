class CreateUserFederationDivisionScores < ActiveRecord::Migration[6.0]
  def change
    create_table :user_federation_division_scores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :federation, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
