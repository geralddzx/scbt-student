class AddColumnApprovedBy < ActiveRecord::Migration
  def change
    add_column :enrollments, :approved_by, :integer
  end
end
