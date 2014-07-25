class SessionsController < ApplicationController
  def new
    @user = User.new
    @controller = "sessions"
    render :new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.class == User
      sign_in(user)
    elsif user.class == String
      flash[:errors] = "Password is incorrect"
      redirect_to new_session_url
    else
      flash[:errors] = "Email does not exist"
      redirect_to new_session_url
    end
  end
  
  def destroy
    sign_out
  end
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
