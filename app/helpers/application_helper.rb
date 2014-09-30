module ApplicationHelper
  def require_sign_in
    redirect_to new_session_url unless current_user
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

  def to_unit(num)
    units = ["B", "KB", "MB", "GB"]
    hash = Hash.new
    units.each_index do |index|
      hash[units[index]] = num * 1.0 / (1024 ** index)
    end
    hash.select! do |k,v|
      v.round > 0
    end
    best_key = hash.key(hash.values.min)
    hash[best_key].round(1).to_s + " " + best_key
  end
end
