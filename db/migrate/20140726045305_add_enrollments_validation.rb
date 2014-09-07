class AddEnrollmentsValidation < ActiveRecord::Migration
  def change
    change_column :enrollments, :student_id, :string, null: false
    change_column :enrollments, :program_id, :string, null: false
  end
end
