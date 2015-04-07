class AddIndexOnUserPermission < ActiveRecord::Migration
  def change
    add_index :users, :permission
  end
end
