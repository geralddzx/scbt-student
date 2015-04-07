class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|
      t.string :name, null: false
      t.integer :manager_id	
      t.timestamps
    end
  end
end
