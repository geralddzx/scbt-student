class Api::AnnouncementsController < ApplicationController
	before_action :require_sign_in
	before_action :require_author, only: [:update, :destroy]
	before_action :require_admin_or_instructor, only: [:create]

	def index
    render json: Announcement.all
  end

  def create
    @campus = Campus.new(campus_params)
    if @campus.save
      render "api/campuses/show"
    else
      render json: @campus.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def show
    @campus = Campus.find(params[:id])
    # include this user's program_enrollment if any.
    render "api/campuses/show"
  end

  def update
    @campus = Campus.find(params[:id])
    if @campus.update_attributes(campus_params)
      render "api/campuses/show"
    else
      render json: @campus.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy!
    render json: @announcement
  end

  def require_author
  	@announcement = Announcement.find(params[:id])
  	if @announcement.author_id != current_user.id
  		render json: "You must be the author to make this request", status: :unauthorized
  	end
  end

  def require_admin_or_instructor
  	@program = paramsx
  	# unless current_user.admin? || 
  end

  def announcement_params
    params.require(:announcement).permit(:id, :title, :content, :author_id)
  end


end
