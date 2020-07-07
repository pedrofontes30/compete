class AddCityToCompetitions < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :city, :string
  end
end
