class AddAnnouncementTable < ActiveRecord::Migration
  def change
  	create_table :announcements do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
      t.text :content
      t.timestamps
    end
  end
end
