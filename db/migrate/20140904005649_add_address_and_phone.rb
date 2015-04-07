class AddAddressAndPhone < ActiveRecord::Migration
  def change
  	add_column :users, :street, :string
  	add_column :users, :city, :string
  	add_column :users, :country, :string
  	add_column :users, :postal_code, :string
  	add_column :users, :phone, :integer
  end
end
