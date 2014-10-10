class Api::AnnouncementsController < ApplicationController
	before_action :require_sign_in
	before_action :require_author, only: [:update, :destroy]
	before_action :check_create_permission, only: [:create]

	def index
    @announcements =  Announcement.where(source: nil).order(:updated_at).reverse
    render "api/announcements/index"
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.source = @source
    if @announcement.save
      render @announcement
    else
      render json: @announcement.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def show
    @announcement = announcement.find(params[:id])
    # include this user's program_enrollment if any.
    render @announcement
  end

  def update
    @announcement = announcement.find(params[:id])
    if @announcement.update_attributes(announcement_params)
      render "api/announcementes/show"
    else
      render json: @announcement.errors.full_messages.join(", "), status: :unprocessable_entity
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

  def check_create_permission
    type = params[:announcement][:source_type]
    id = params[:announcement][:source_id]
    if type && id
      @source = type.constantize.find(id)
    end

    return if current_user.master_admin?
    return if current_user.admin? && type != "Campus"
    return if @source.class == Program && @source.instructor == current_user
    return if @source.class == Campus && @source.manager == current_user
    @source_phrase = " in this " + @source.class.to_s.downcase if @source
    render json: "You are not permitted to create announcements" + @source_phrase, status: :unauthorized
  end

  def announcement_params
    params.require(:announcement).permit(:title, :content, :source_id, :source_type)
  end
end
