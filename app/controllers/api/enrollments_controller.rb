class Api::EnrollmentsController < ApplicationController
  before_action :require_activation
  before_action :require_student, only: [:enroll]
  before_action :require_admin, only: [:update, :search_index, :approve]
  before_action :require_student, only: [:user_index]

  def create
    @enrollment = Enrollment.new(
      program_id: params[:enrollment][:program_id]
    )    
    @enrollment.student_id = current_user.id
    
    if @enrollment.save
      render json: @enrollment
    else
      render json: @enrollment.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
  
  def update
    @enrollment = Enrollment.find(params[:id])
    attributes[:approver_id] = current_user.id if status == "APPROVED"
    attributes[:approved_id] = nil if status == "PENDING"
    if @enrollment.update_attributes(attributes)
      render "api/enrollments/show"
    else
      render json: @enrollment.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def approve
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.status == "PENDING" 
      @enrollment.status = "APPROVED"
      @enrollment.approver_id = current_user.id
      @enrollment.save
      render "api/enrollments/show"
    else 
      render json: "This enrollment is already approved", status: :unprocessable_entity
    end
  end 

  def enroll
    @enrollment = Enrollment.new(student_id: current_user.id, section_id: params[:section_id])
    if @enrollment.save
      render json: @enrollment
    else
      render json: @enrollment.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  def user_index
    render "api/enrollments/user_index"
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    # return render json: "This enrollment does not exist" if @enrollment.nil?
    if current_user.admin? || @enrollment.student_id == current_user.id
      @enrollment.destroy!
      render json: @enrollment
    else
      render json: "You must be an admin or enrolled", status: :unauthorized
    end
  end

  def search_index
    render "api/enrollments/search_index"
  end

  def enrollment_params
    params.require(:enrollment).permit(:status)
  end
end

# Backbone Enrollment model:
# student_id
# program_id
# urlRoot: /api/enrollments