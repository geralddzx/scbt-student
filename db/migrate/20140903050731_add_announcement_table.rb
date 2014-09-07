class AddAnnouncementTable < ActiveRecord::Migration
  def change
  	create_table :announcements do |t|
      t.integer :author_id
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
