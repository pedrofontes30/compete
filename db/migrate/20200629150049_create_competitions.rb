class CreateCompetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :address
      t.references :federation, null: false, foreign_key: true
      t.date :date
      t.text :description
      t.integer :prize
      t.date :registration_deadline
      t.integer :registration_price

      t.timestamps
    end
  end
end
