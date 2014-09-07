class Api::EnrollmentsController < ApplicationController
  before_action :require_sign_in
  before_action :require_student, only: [:create]
  before_action :require_admin, only: [:update]
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
    @enrollment = Enrollment.find(params[:enrollment][:id])
    status = params[:enrollment][:status]
    attributes = {status: status}
    attributes[:approver_id] = current_user.id if status == "APPROVED"
    attributes[:approved_id] = nil if status == "PENDING"
    if @enrollment.update_attributes(attributes)
      render "api/enrollments/show"
    else
      render json: @enrollment.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
end

# Backbone Enrollment model:
# student_id
# program_id
# urlRoot: /api/enrollments