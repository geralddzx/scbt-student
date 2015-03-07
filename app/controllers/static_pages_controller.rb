class StaticPagesController < ApplicationController
  before_action :ensure_signed_in
  
  def root
  	expires_in 24.hours, :public => true
    render :root

  end
  
  def ensure_signed_in
    redirect_to new_session_url unless current_user
  end
end
