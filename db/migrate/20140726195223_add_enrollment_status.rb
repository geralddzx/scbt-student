class AddEnrollmentStatus < ActiveRecord::Migration
  def change
    add_column :enrollments, :status, :string, null: false
  end
end
