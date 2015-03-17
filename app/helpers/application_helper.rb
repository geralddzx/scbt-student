module ApplicationHelper
  def require_sign_in
    # redirect_to new_session_url unless current_user 
    render json: "require_auth", status: :unauthorized unless current_user
  end

  def require_activation
    # redirect_to new_session_url unless current_user 
    require_sign_in
    if current_user
      render json: "require_activation", status: :unauthorized unless current_user.activated?
    end
  end

  def sign_in(user)
    add_alert("Your account is not activated, please activate your account through email now.") unless user.activated?
    session[:session_token] = user.reset_token
    redirect_to home_url
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def sign_out
    current_user.reset_token if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def add_alert(string)
    flash[:alert] = flash[:alert] || ""
    flash[:alert] += string + " "
  end
end
