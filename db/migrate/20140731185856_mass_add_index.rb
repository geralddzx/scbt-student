class MassAddIndex < ActiveRecord::Migration
  def change
    add_index :courses, :instructor_id
    add_index :enrollments, :status
  end
end
