class CampusAddAddress < ActiveRecord::Migration
  def change
  	add_column :campuses, :street, :string, null: false
  	add_column :campuses, :city, :string, null: false
  	add_column :campuses, :country, :string
  	add_column :campuses, :postal_code, :string, null: false
  end
end
