class AddColumnsForSurvey < ActiveRecord::Migration
  def change
  	add_column :programs, :survey_id, :integer
  	add_column :campuses, :survey_id, :integer
  	add_column :users, :survey_id, :integer
  end
end
