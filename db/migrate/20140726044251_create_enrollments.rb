class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :program_id
      t.timestamps
    end
    add_index :enrollments, :student_id
    add_index :enrollments, :program_id
    add_index :enrollments, [:student_id, :program_id], unique: true
  end
end
