class AddColumnsToAnnouncement < ActiveRecord::Migration
  def change
  	add_column :announcements, :source, polymorphic: true
  end
end
