class StaticPagesController < ApplicationController
  before_action :ensure_signed_in
  
  def root
    @controller = "static_pages"
    render :root
  end
  
  def ensure_signed_in
    redirect_to new_session_url unless current_user
  end
end
