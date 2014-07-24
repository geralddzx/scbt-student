module ApplicationHelper
  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_token
    redirect_to root_url
  end
  
  def current_user
    @current_user || @current_user =
    User.find_by_session_token(session[:session_token])
  end
  
  def sign_out
    session[:session_token] = nil
    current_user.reset_token
  end
end
