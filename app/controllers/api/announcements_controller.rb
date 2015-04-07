class Api::AnnouncementsController < ApplicationController
	before_action :require_sign_in
	before_action :require_author, only: [:update]
  before_action :require_author_or_admin, only: [:destroy]
	before_action :check_create_permission, only: [:create]

	def index
    page_num = params[:page]
    @announcements = Announcement.where(source: nil).order("updated_at DESC").page(page_num)
    render "api/announcements/index"
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.author_id = current_user.id
    @announcement.source = @source
    if @announcement.save
      render json: @announcement, only: [:id]
    else
      render json: @announcement.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def show
    @announcement = Announcement.find(params[:id])
    # include this user's program_enrollment if any.
    render "api/announcements/show"
  end

  def update
    if @announcement.update_attributes(announcement_params)
      render "api/announcements/show"
    else
      render json: @announcement.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcements = Announcement.where(source: nil).order("updated_at DESC").to_a
    pos = 1 + @announcements.index {|announcement| announcement.id == @announcement.id}
    @page = Announcement.new_page_num(pos, @announcements.count)

    @announcement.destroy!
    @announcements = Announcement.where(source: nil).order("updated_at DESC").page(@page)
    render "api/announcements/destroy"
  end

  def require_author
  	@announcement = Announcement.find(params[:id])
  	if @announcement.author_id != current_user.id
  		render json: "You must be the author to make this request", status: :unauthorized
  	end
  end

  def require_author_or_admin
    return if current_user.admin?
    require_author
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
    render json: "You are not permitted to create announcements" + @source_phrase.to_s, status: :unauthorized
  end

  def announcement_params
    params.require(:announcement).permit(:title, :content)
  end
end
