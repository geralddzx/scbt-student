class CreateProgramOfferings < ActiveRecord::Migration
  def change
    create_table :program_offerings do |t|
      t.integer :program_id, null: false
      t.integer :campus_id, null: false
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
    
    add_index :program_offerings, :program_id
  	add_index :program_offerings, :campus_id
  	add_index :program_offerings, [:program_id, :campus_id]
  end 
end
