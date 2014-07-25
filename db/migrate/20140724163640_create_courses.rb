class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :code
      t.date  :start_date
      t.date  :end_date
      t.integer :hours
      t.timestamps
    end
  end
end
