class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.string :question, null: false
      t.string :answer_type, null: false
      
      t.integer :survey_id
      t.integer :min_rating
      t.integer :max_rating
      t.timestamps
    end
  end
end
