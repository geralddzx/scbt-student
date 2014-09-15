class Api::UsersController < ApplicationController
  include UsersHelper

  before_action :require_master_admin, only: [:index]
  def update
    if current_user.update_attributes(user_params)
      render json: current_user
    else
      render json: current_user.errors.full_messages, status: :unproccessable_entity
    end
  end
  
  def show
    render json: current_user
  end
  
  def index
    if request.url.include?("instructors")
      render json: User.where(permission: "INSTRUCTOR")
    else
      render json: User.all
    end
  end
end
