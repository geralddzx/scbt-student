class ChangeEnrollmentDataType < ActiveRecord::Migration
  def change
    remove_column :enrollments, :student_id
    remove_column :enrollments, :program_id
    add_column :enrollments, :student_id, :integer, null: false
    add_column :enrollments, :program_id, :integer, null: false
  end
end
