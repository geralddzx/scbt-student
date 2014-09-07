class AddInstructorIdInPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :instructor_id, :integer
  end
end
