class AddTeamToAffiliations < ActiveRecord::Migration[6.0]
  def change
    add_column :affiliations, :team, :string
  end
end
