class AddSkuToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :sku, :string
  end
end
