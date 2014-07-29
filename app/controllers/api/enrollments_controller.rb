class Api::EnrollmentsController < ApplicationController
  before_action :require_sign_in
  before_action :require_student, only: [:create]
  before_action :require_admin, only: [:update]
  def create
    @enrollment = Enrollment.new(
      course_id: params[:enrollment][:course_id]
    )    
    @enrollment.student_id = current_user.id
    @enrollment.status = "PENDING"
    
    if @enrollment.save
      render json: @enrollment
    else
      render json: @enrollment.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
  
  def update
    @enrollment = Enrollment.find(params[:enrollment][:id])
    if @enrollment.update_attributes({status: params[:enrollment][:status]})
      render json: @enrollment
    else
      render json: @enrollment.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
end

# Backbone Enrollment model:
# student_id
# course_id
# urlRoot: /api/enrollments