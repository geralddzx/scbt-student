class AddUserReferral < ActiveRecord::Migration
  def change
  	add_column :users, :referral, :string
  end
end
