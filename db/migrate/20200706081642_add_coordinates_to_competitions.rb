class AddCoordinatesToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :latitude, :float
    add_column :competitions, :longitude, :float
  end
end
