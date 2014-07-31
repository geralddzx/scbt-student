class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  # def require_permission
#     unless ["ADMIN", "INSTRUCTOR"].include?(current_user.permission)
#       render json: "You are not permitted, please contact scbt admin", status: :unauthorized
#     end
#   end
  
  def require_student
    unless current_user.student?
      render json: "You must be a student to make this request", status: :unauthorized
    end
  end
  
  def require_instructor
    unless current_user.instructor?
      puts true
      render json: "You must be an instructor to make this request", status: :unauthorized
    end
  end
  
  def require_admin_or_master
    unless current_user.admin? || current_user.master?
      puts true
      render json: "You must be an admin or master to make this request", status: :unauthorized
    end
  end
end
