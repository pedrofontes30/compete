class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.integer :position
      t.integer :position_points

      t.timestamps
    end
  end
end
