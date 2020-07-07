class ChangeUserToAllowNullInHeats < ActiveRecord::Migration[6.0]
  def change
    change_column :heats, :user_id, :integer, :null => true
  end
end
