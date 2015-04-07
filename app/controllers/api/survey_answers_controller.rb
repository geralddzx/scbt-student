class Api::SurveyAnswersController < ApplicationController
	before_action :require_activation
	# before_action :require_student, only: [:answer_questions]
	def subject_index
		@subject = request_root_class.find(request_id.to_i)
		@survey = @subject.survey
		@questions = @subject.survey_questions
		question_ids = @questions.pluck(:id)

		@answers = SurveyAnswer.where(subject: @subject).where(student: current_user).where(question: question_ids)
		render "api/survey_answers/subject_index"
	end

	def answer_questions
		@errors = []
		@answers = params[:_json]
		@answers.each do |answer|
			if answer["id"]
				update(answer)
			else
				create(answer)
			end
		end
		render_errors
	end

	def create(answer)
		current_answer = SurveyAnswer.new(answer_params(answer))
		# return unless (current_answer.comment || current_answer.rating)
		current_answer.student_id = current_user.id
		unless current_answer.save
			message = current_answer.errors.full_messages.join(", ")
			@errors.push("Question #{answer["number"]} #{message}")
		end
	end

	def update(answer)
		current_answer = SurveyAnswer.find_by_id(answer["id"])
		return @errors.push("Question #{answer["number"]} answer id does not exist") if !current_answer
		return if current_answer.student_id != current_user.id
		current_answer.comment = answer["comment"]
		current_answer.rating = answer["rating"]
		unless current_answer.save
			message = current_answer.errors.full_messages.join(", ")
			@errors.push("Question #{answer["number"]}: #{message}")
		end
	end

	def answer_params(answer)
		answer.permit(:question_id, :comment, :rating, :subject_id, :subject_type)
	end

	def request_root_class
		request.url.split("/")[4].singularize.capitalize.constantize
	end

	def request_id
		request.url.split("/")[5]
	end

	def render_errors
		if @errors.empty?
			render json: @errors
		else
			render json: @errors.join("\n"), status: :unprocessable_entity
		end
	end
end
