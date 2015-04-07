class AddColumnsToSurveyAnswers < ActiveRecord::Migration
  def change
  	add_column :survey_answers, :subject_type, :string, null: false
  	add_column :survey_answers, :subject_id, :integer, null: false
  end
end
