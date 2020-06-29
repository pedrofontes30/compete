class CreateAffiliations < ActiveRecord::Migration[6.0]
  def change
    create_table :affiliations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :federation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
