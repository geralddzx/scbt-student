class Api::CampusesController < ApplicationController
  before_action :require_sign_in
  before_action :require_admin, only: [:create, :update, :destroy]
  
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
