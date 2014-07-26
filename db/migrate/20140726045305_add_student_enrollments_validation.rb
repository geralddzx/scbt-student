class AddStudentEnrollmentsValidation < ActiveRecord::Migration
  def change
    change_column :student_enrollments, :student_id, :string, null: false
    change_column :student_enrollments, :course_id, :string, null: false
  end
end
