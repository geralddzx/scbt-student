class ChangeStudentEnrollmentDataType < ActiveRecord::Migration
  def change
    remove_column :student_enrollments, :student_id
    remove_column :student_enrollments, :course_id
    add_column :student_enrollments, :student_id, :integer, null: false
    add_column :student_enrollments, :course_id, :integer, null: false
  end
end
