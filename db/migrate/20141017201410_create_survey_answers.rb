class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.string :comment
      t.integer :rating
      
      t.integer :question_id
      t.integer :student_id
      t.timestamps
    end
  end
end
