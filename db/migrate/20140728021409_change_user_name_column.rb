class ChangeUserNameColumn < ActiveRecord::Migration
  def change
    remove_column :users, :name
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
  end
end
