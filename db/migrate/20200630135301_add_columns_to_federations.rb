class AddColumnsToFederations < ActiveRecord::Migration[6.0]
  def change
    add_column :federations, :name, :string
    add_column :federations, :location, :string
    add_column :federations, :affiliation_price, :integer
  end
end
