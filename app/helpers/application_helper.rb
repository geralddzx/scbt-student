module ApplicationHelper
  def sign_in(user)
    session[:session_token] = user.reset_token
    redirect_to root_url
  end
  
  def current_user
    User.find_by_session_token(session[:session_token])
  end
  
  def sign_out
    current_user.reset_token
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
