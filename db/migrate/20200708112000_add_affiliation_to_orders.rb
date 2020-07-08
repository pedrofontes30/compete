class AddAffiliationToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :affiliation, null: true, foreign_key: true
  end
end
