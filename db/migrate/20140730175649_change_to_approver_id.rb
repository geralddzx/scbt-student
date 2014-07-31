class ChangeToApproverId < ActiveRecord::Migration
  def change
    rename_column :enrollments, :approved_by, :approver_id
  end
end
