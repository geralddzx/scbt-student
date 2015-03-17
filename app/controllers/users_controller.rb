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
      add_alert('You have created the user: ' + ERB::Util.html_escape(@user.email) + ".")
      @user.set_activation_code
      UserMailer.activation(@user, request.host_with_port)
      sign_in(@user)
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end 
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirm, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral)
  end

  def activate
    @user = User.find(params[:user_id])
    if(@user.activation_code == params[:activation_code])
      @user.activation_code = nil
      @user.save
      @activation_success = true
    end
    render :activation
  end
end
