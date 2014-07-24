class StaticPagesController < ApplicationController
  before_action :ensure_signed_in
  
  def root
    render :root
  end
  
  def ensure_signed_in
    redirect_to new_session_url unless current_user
  end
end
