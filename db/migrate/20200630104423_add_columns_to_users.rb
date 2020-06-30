class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :nationality, :string
    add_column :users, :gender, :string

  end
end
