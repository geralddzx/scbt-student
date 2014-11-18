class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :program_id, null: false
      t.integer :campus_id, null: false
      t.integer :instructor_id, null: false
      t.string :code, null: false
      
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday

      t.integer :start_hour
      t.integer :start_minute

      t.integer :end_hour
      t.integer :end_minute

      t.timestamps
    end
    
    add_index :sections, :program_id
  	add_index :sections, :campus_id
    add_index :sections, :instructor_id
  	add_index :sections, [:code, :program_id], unique: true
  end 
end
