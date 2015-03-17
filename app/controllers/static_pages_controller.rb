class StaticPagesController < ApplicationController
  before_action :ensure_signed_in
  
  def root
  	expires_in 24.hours, :public => true
    render :root
  end

  def home
  	if current_user
  		render :home
  	else
  		redirect_to new_session_url
  	end
  end
  
  def ensure_signed_in
    
  end
end
