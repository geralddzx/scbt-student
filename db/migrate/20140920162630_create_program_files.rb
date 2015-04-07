class CreateProgramFiles < ActiveRecord::Migration
  def change
    create_table :program_files do |t|
      t.string :program_id, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
