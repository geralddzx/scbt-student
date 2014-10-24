class Api::SurveysController < ApplicationController
  before_action :require_sign_in
  before_action :require_admin, only: [:new, :create, :update, :destroy]
  
  def index
  	render json: Survey.all, only: [:id, :title, :created_at, :updated_at]
  end

  def new
  	render "api/surveys/new"
  end

  def show
    render json: Survey.find(params[:id])
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey
    else
      render json: @survey.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      render json: @survey
    else
      render json: @program.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy!
    render json: @survey
  end

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
