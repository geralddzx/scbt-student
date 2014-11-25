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
      flash[:alerts] = 'alert("You have created the user: ' + ERB::Util.html_escape(@user.email) + '")'
      sign_in(@user)
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end 
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirm, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral)
  end
end
