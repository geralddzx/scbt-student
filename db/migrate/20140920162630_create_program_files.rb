class CreateProgramFiles < ActiveRecord::Migration
  def change
    create_table :program_files do |t|
      t.string :program_id, null: false
      # t.attachment :file
      t.string :file_file_name, null: false
      t.string :file_file_size, null: false
      t.datetime :created_at
    end
  end
end
