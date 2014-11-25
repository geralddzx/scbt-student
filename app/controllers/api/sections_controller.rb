class Api::SectionsController < ApplicationController
  before_action :require_sign_in
  before_action :require_admin, only: [:new, :edit, :update, :create, :destroy]
#   before_action :require_student, only: [:user_index]
#   before_action :require_admin, only: [:reset_survey]

  def create
    @section = Section.new(section_params)
    if @section.save
      render "api/sections/_show"
    else
      render json: @section.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
  
  def new
    render "api/sections/_new"
  end

  def edit
    @section = Section.find(params[:id])
    render "api/sections/edit"
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      render "api/sections/_show"
    else
      render json: @section.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end    
  
  def index
    @programs = Program.all
    render "api/sections/programs_index"
  end

#   def user_index
#     render "api/programs/user/index"
#   end

  def program_index
    @sections = Section.where(program_id: params[:program_id])
    render "api/sections/_index"
  end

  def user_index
    @sections = current_user.enrolled_sections
    render "api/sections/_index"
  end

#   def reset_survey
#     Survey.find(params[:survey_id])
#     @programs = Program.where(survey_id: params[:survey_id])
#     @programs.update_all(survey_id: nil)

#     @program_hosts = Program.where(id: params[:host_ids].keys)
#     @program_hosts.update_all(survey_id: params[:survey_id])
#     render "api/programs/survey_index"
#   end
  
  def destroy
    @section = Section.find(params[:id])
    @section.destroy!
    render json: @section
  end

  def section_params
    params.require(:section).permit(
    	:code, 
    	:instructor_id,       
   		:program_id,
   		:campus_id, 
   		:monday,      
   		:tuesday,     
   		:wednesday,   
   		:thursday,    
   		:friday,      
   		:saturday,   
   		:sunday,      
   		:start_hour,  
   		:start_minute,
   		:end_hour,   
   		:end_minute
   	)  
  end
end
