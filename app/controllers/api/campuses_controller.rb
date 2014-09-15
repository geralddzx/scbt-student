class Api::CampusesController < ApplicationController
  before_action :require_sign_in
  def index
	render json: Campus.all
  end

  def show
    @campus = Campus.find(params[:id])
    # include this user's program_enrollment if any.
    render "api/campuses/show"
  end
end
