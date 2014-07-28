class RenameEnrollment < ActiveRecord::Migration
  def change
    rename_table :enrollments, :enrollments
  end
end
