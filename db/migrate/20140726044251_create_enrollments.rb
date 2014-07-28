class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :course_id
      t.timestamps
    end
    add_index :enrollments, :student_id
    add_index :enrollments, :course_id
    add_index :enrollments, [:student_id, :course_id], unique: true
  end
end
