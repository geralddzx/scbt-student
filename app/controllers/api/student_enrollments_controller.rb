class Api::StudentEnrollmentsController < ApplicationController
  before_action :require_sign_in
  before_action :require_student, only: [:create]
  before_action :require_instructor, only: [:update]
  def create
    @enrollment = StudentEnrollment.new(
      course_id: params[:student_enrollment][:course_id]
    )    
    @enrollment.student_id = current_user.id
    @enrollment.status = "PENDING"
    
    if @enrollment.save
      render json: @enrollment
    else
      render json: @enrollment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def update
    render json: @enrollment
  end
end

# Backbone StudentEnrollment model:
# student_id
# course_id
# urlRoot: /api/student_enrollments