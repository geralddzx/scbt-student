class UsersController < ApplicationController
  def new
    @user = User.new
    @controller = "users"
    render :new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notices] = "You have created the user: #{@user.email}"
      sign_in(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end 
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
