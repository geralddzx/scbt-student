class AddColumnsToAnnouncement < ActiveRecord::Migration
  def change
  	add_column :announcements, :source_type, :string
  	add_column :announcements, :source_id, :integer
  end
end
