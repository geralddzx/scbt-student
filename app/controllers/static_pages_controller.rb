class StaticPagesController < ApplicationController
  before_action :ensure_signed_in

  def root
  	if current_user
  		render :root
  	else
  		redirect_to new_session_url
  	end
  end
  
  def ensure_signed_in
    
  end
end
