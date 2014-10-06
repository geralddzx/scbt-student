class Api::UsersController < ApplicationController
  include UsersHelper
  wrap_parameters :user, include: [:email, :password, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral, :photo, :photo_name]
  before_action :require_master_admin, only: [:index, :admins, :instructors]
  before_action :require_sign_in

  def update
    current_user.assign_attributes(user_params)
    current_user.set_photo(params)
    if current_user.save
      # old_photo.destroy if params[:user][:delete_old] && old_photo.exists?
      render "api/users/show"
    else
      render json: current_user.errors.full_messages, status: :unproccessable_entity
    end
  end
  
  def show
    render "api/users/show"
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

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral, :photo)
  end
end
