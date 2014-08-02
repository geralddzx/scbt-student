class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    @user = User.new(email: params[:user][:email])
    @controller = "sessions"
    
    if user.class == User
      sign_in(user)
    elsif user.class == String
      flash.now[:errors] = "Password is incorrect"
      render :new
    else
      flash.now[:errors] = "Email does not exist"
      render :new
    end
  end
  
  def destroy
    sign_out
  end
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
