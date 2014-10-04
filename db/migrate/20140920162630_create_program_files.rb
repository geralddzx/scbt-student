class CreateProgramFiles < ActiveRecord::Migration
  def change
    create_table :program_files do |t|
      t.string :program_id, null: false
      t.attachment :file
    end
  end
end
