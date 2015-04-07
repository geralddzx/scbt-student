class Api::SurveyQuestionsController < ApplicationController
  before_action :require_activation
  before_action :require_admin, only: [:create, :update, :destroy]
 #  before_action :require_admin, only: [:reset_survey]

 #  def index
 #    render json: Campus.all
 #  end

  def create
    @question = SurveyQuestion.new(question_params)
    if @question.save
      render json: @question
    else
      render json: @question.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

 #  def show
 #    @question = Campus.find(params[:id])
 #    # include this user's program_enrollment if any.
 #    render "api/campuses/show"
 #  end

  def update
    @question = SurveyQuestion.find(params[:id])
    @question.survey_id = params[:survey_question][:survey_id]
    if @question.save
      render json: @question
    else
      render json: @question.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
  
	def survey_index
		render json: SurveyQuestion.where(survey_id: params[:survey_id])
	end

 #  def reset_survey
 #    Survey.find(params[:survey_id])
 #    @campuses = Campus.where(survey_id: params[:survey_id])
 #    @campuses.update_all(survey_id: nil)

 #    @campus_hosts = Campus.where(id: params[:host_ids].keys)
 #    @campus_hosts.update_all(survey_id: params[:survey_id])
 #    render "api/campuses/survey_index"
 #  end

 #  def destroy
 #    @campus = Campus.find(params[:id])
 #    @campus.destroy!
 #    render json: @campus
 #  end


  def question_params
    params.require(:survey_question).permit(:question, :answer_type, :min_rating, :max_rating, :survey_id)
  end
end
