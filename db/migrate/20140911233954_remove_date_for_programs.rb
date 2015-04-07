class RemoveDateForPrograms < ActiveRecord::Migration
  def change
  	remove_column :programs, :start_date
  	remove_column :programs, :end_date
  end
end
