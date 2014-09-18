class Api::UsersController < ApplicationController
  include UsersHelper

  before_action :require_master_admin, only: [:index, :admins, :instructors]
  def update
    if current_user.update_attributes(user_params)
      render json: current_user
    else
      render json: current_user.errors.full_messages, status: :unproccessable_entity
    end
  end
  
  def show
    render json: current_user, only: [:id, :first_name, :last_name, :email, :street, :city, :country, :postal_code, :phone]
  end
  
  def index
    render json: User.all, only: [:id, :first_name, :last_name, :email]
  end

  def admins
    render json: User.where(permission: ["ADMIN", "MASTER_ADMIN"]), only: [:id, :first_name, :last_name, :email]
  end

  def instructors
    render json: User.where(permission: ["INSTRUCTOR"]), only: [:id, :first_name, :last_name, :email]
  end
end
