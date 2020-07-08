class AddPriceToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_monetize :registrations, :price, currency: { present: false }
  end
end
