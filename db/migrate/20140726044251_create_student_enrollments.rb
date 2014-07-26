class CreateStudentEnrollments < ActiveRecord::Migration
  def change
    create_table :student_enrollments do |t|
      t.integer :student_id
      t.integer :course_id
      t.timestamps
    end
    add_index :student_enrollments, :student_id
    add_index :student_enrollments, :course_id
    add_index :student_enrollments, [:student_id, :course_id], unique: true
  end
end
