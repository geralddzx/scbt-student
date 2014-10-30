class Api::ProgramsController < ApplicationController
  before_action :require_sign_in
  before_action :require_admin, only: [:update, :create, :destroy]
  before_action :require_student, only: [:user_index]
  before_action :require_admin, only: [:reset_survey]

  def create
    @program = Program.new(program_params)
    if @program.save
      render "api/programs/show"
    else
      render json: @program.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
  
  def show
    @program = Program.find(params[:id])
    render "api/programs/show"
  end
  
  def update
    @program = Program.find(params[:id])
    if @program.update_attributes(program_params)
      render "api/programs/show"
    else
      render json: @program.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end    
  
  def index
    render json: Program.all
  end

  def user_index
    render "api/programs/user/index"
  end

  def survey_index
    @programs = Program.all
    @program_hosts = Program.where(survey_id: params[:survey_id])
    render "api/programs/survey_index"
  end

  def reset_survey
    Survey.find(params[:survey_id])
    @programs = Program.where(survey_id: params[:survey_id])
    @programs.update_all(survey_id: nil)

    @program_hosts = Program.where(id: params[:host_ids].keys)
    @program_hosts.update_all(survey_id: params[:survey_id])
    render "api/programs/survey_index"
  end
  
  def destroy
    @program = Program.find(params[:id])
    # return render json: "This program does not exist" if @program.nil?
    @program.destroy!
    render json: @program
  end

  def program_params
    attributes = params.require(:program).permit(:name, :code, :start_date, :end_date, :hours, :instructor_id)
    attributes.delete(:instructor_id) unless current_user.master_admin?
    return attributes
  end
end
