class ChangeEnrollmentDataType < ActiveRecord::Migration
  def change
    remove_column :enrollments, :student_id
    remove_column :enrollments, :course_id
    add_column :enrollments, :student_id, :integer, null: false
    add_column :enrollments, :course_id, :integer, null: false
  end
end
