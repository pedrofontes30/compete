class AddDateToCompetition < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :start_time, :datetime
  end
end
