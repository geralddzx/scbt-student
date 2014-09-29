class AddFilenameToProgramFile < ActiveRecord::Migration
  def change
  	add_column :program_files, :file_name, :string, null:false
  end
end
