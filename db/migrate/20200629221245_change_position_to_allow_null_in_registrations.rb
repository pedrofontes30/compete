class ChangePositionToAllowNullInRegistrations < ActiveRecord::Migration[6.0]
  def change
    change_column :registrations, :position_id, :integer, :null => true
  end
end
