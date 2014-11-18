class Api::CampusesController < ApplicationController
  before_action :require_sign_in
  before_action :require_admin, only: [:create, :update, :destroy]
  before_action :require_admin, only: [:reset_survey]

  def index
    render json: Campus.all
  end

  def create
    @campus = Campus.new(campus_params)
    if @campus.save
      render "api/campuses/show"
    else
      render json: @campus.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def show
    @campus = Campus.find(params[:id])
    # include this user's program_enrollment if any.
    render "api/campuses/show"
  end

  def update
    @campus = Campus.find(params[:id])
    if @campus.update_attributes(campus_params)
      render "api/campuses/show"
    else
      render json: @campus.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
  
  def survey_index
    @campuses = Campus.all
    @campus_hosts = Campus.where(survey_id: params[:survey_id])
    render "api/campuses/survey_index"
  end

  def reset_survey
    Survey.find(params[:survey_id])
    @campuses = Campus.where(survey_id: params[:survey_id])
    @campuses.update_all(survey_id: nil)

    @campus_hosts = Campus.where(id: params[:host_ids].keys)
    @campus_hosts.update_all(survey_id: params[:survey_id])
    render "api/campuses/survey_index"
  end

  def destroy
    @campus = Campus.find(params[:id])
    @campus.destroy!
    render json: @campus
  end

  def campus_params
    attributes = params.require(:campus).permit(:name, :street, :city, :postal_code, :country, :manager_id)
  	attributes.delete(:manager_id) unless current_user.master_admin?
    return attributes
  end
end
