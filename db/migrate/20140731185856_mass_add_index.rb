class MassAddIndex < ActiveRecord::Migration
  def change
    add_index :enrollments, :status
  end
end
