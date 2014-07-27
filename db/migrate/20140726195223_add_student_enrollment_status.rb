class AddStudentEnrollmentStatus < ActiveRecord::Migration
  def change
    add_column :student_enrollments, :status, :string, null: false
  end
end
