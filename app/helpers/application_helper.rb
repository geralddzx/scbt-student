module ApplicationHelper
  def require_sign_in
    # redirect_to new_session_url unless current_user 
    render json: {require_auth: true} unless current_user
  end

  def sign_in(user)
    session[:session_token] = user.reset_token
    redirect_to root_url
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def sign_out
    current_user.reset_token if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
