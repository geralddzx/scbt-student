class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :student_id, null: false
      t.integer :section_id, null: false
      t.timestamps
    end
    add_index :enrollments, :student_id
    add_index :enrollments, :section_id
    add_index :enrollments, [:student_id, :section_id], unique: true
  end
end
