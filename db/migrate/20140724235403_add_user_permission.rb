class AddUserPermission < ActiveRecord::Migration
  def change
    add_column :users, :permission, :string, null: false
  end
end
