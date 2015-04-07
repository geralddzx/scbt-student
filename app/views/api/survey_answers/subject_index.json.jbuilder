json.answers(@questions) do |question|
	json.survey_answer do
		json.question question
		json.answer @answers.find_by_question_id(question.id)
	end
end

json.survey @survey, :id, :title, :description
json.subject @subject, :id, :name