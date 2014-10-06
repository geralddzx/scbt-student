class UsersController < ApplicationController
  include UsersHelper
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    @controller = "users"
    if @user.save
      flash[:notices] = "You have created the user: #{@user.email}"
      sign_in(@user)
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end 
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral)
  end
end
