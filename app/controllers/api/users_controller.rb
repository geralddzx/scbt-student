class Api::UsersController < ApplicationController
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
  
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
