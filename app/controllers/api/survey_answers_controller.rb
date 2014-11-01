class Api::SurveyAnswersController < ApplicationController
	before_action :require_sign_in
	# before_action :require_student, only: [:answer_questions]
	def subject_index
		@subject = request_root_class.find(request_id.to_i)
		@survey = @subject.survey
		@questions = @subject.survey_questions
		question_ids = @questions.pluck(:id)

		@answers = SurveyAnswer.where(subject: @subject).where(student: current_user).where(question: question_ids)
		render "api/survey_answers/subject_index"
	end

	def request_root_class
		request.url.split("/")[4].singularize.capitalize.constantize
	end

	def request_id
		request.url.split("/")[5]
	end
end
