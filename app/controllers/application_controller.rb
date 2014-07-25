class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  def require_permission
    unless current_user && ["ADMIN", "INSTRUCTOR"].include?(current_user.permission)
      render json: "You are not permitted, please contact scbt admin", status: :unauthorized
    end
  end
end
