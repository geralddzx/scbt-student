class Api::ProgramsController < ApplicationController
  before_action :require_sign_in
  before_action :require_admin, only: [:update, :create, :destroy]
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
    # include this user's program_enrollment if any.
    render "api/programs/show"

    # P1: To start, lets 
    
    # P2: Instructor approval of enrollment. More complicated, because when instructor queries to SHOW a program needs to get **alll** student enrollments.

    # 1. Use JBuilder to ship program_enrollment in show page.
    # 2. Backbone model for ProgramEnrollment
    # 3. Parse method of Program should build a ProgramEnrollment if supplied.
    # 4. Update ProgramShow view to allow enrollment, approval of pending enrollment...
    
    # {
    #   id: 123
    #   name: "Physics",
    #   credit_hours: 10,
    #   program_enrollment: {
    #     status: "PENDING",
    #     program_id: 123,
    #     student_id: 456
    #   }
    # }
    
    # JBuilder template:
    # json.(@program, Program.attribute_names)
    # json.program_enrollment do
    #   @program_enrollment = @program.enrollments.find_by(user_id: current_user.id)
    #   json.(@program_enrollment, ProgramEnrollment.attribute_names)
    # end
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
    if request.url.include?("user")
      render "api/programs/index"
    else
      render json: Program.all
    end
  end
  
  def destroy
    @program = Program.find_by_id(params[:id])
    return render json: "This program does not exist" if @program.nil?
    @program.destroy!
    render json: @program
  end

  def program_params
    attributes = params.require(:program).permit(:name, :code, :start_date, :end_date, :hours, :instructor_id)
    attributes.delete(:instructor_id) unless current_user.master_admin?
    return attributes
  end
end
