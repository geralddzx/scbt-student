class Api::UsersController < ApplicationController
  include UsersHelper
  wrap_parameters :user, include: [:email, :password, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral, :photo, :photo_name, :old, :new, :new_confirm]
  before_action :require_master_admin, only: [:index, :admins, :instructors]
  before_action :require_admin, only: [:reset_survey]
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
    render "api/user/show"
  end

  def show_photo
    render "api/user/show_photo"
  end
  
  def index
    render "api/users/index"
  end

  def change_password
    return render json: "old password is incorrect", status: :unauthorized unless current_user.password?(params[:user][:old])
    current_user.assign_attributes(password: params[:user][:new], password_confirm: params[:user][:new_confirm])
    if current_user.save
      render json: {}
    else
      render json: current_user.errors.full_messages, status: :unproccessable_entity
    end
  end

  def admins
    render json: User.where(permission: ["ADMIN", "MASTER_ADMIN"]), only: [:id, :first_name, :last_name, :email]
  end

  def instructors
    render json: User.where(permission: ["INSTRUCTOR"]), only: [:id, :first_name, :last_name, :email]
  end

  def survey_index
    @instructors = User.where(permission: "INSTRUCTOR")
    @instructor_hosts = User.where(survey_id: params[:survey_id])
    render "api/users/survey_index"
  end

  def reset_survey
    Survey.find(params[:survey_id])
    @instructors = User.where(survey_id: params[:survey_id])
    @instructors.update_all(survey_id: nil)

    @instructor_hosts = User.where(permission: "INSTRUCTOR").where(id: params[:host_ids].keys)
    @instructor_hosts.update_all(survey_id: params[:survey_id])
    render "api/users/survey_index"
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral, :photo)
  end
end
