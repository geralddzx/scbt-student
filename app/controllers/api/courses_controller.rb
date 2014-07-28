class Api::CoursesController < ApplicationController
  before_action :require_sign_in
  before_action :require_permission, only: [:update, :create, :destroy]
  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course
    else
      render json: @course.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    @course = Course.find(params[:id])
    # include this user's course_enrollment if any.
    @current_user_enrollment = @course.student_enrollments.find_by(student_id: current_user.id) || StudentEnrollment.new
    render "api/courses/show"

    # P1: To start, lets 
    
    # P2: Instructor approval of enrollment. More complicated, because when instructor queries to SHOW a course needs to get **alll** student enrollments.

    # 1. Use JBuilder to ship course_enrollment in show page.
    # 2. Backbone model for CourseEnrollment
    # 3. Parse method of Course should build a CourseEnrollment if supplied.
    # 4. Update CourseShow view to allow enrollment, approval of pending enrollment...
    
    # {
    #   id: 123
    #   name: "Physics",
    #   credit_hours: 10,
    #   course_enrollment: {
    #     status: "PENDING",
    #     course_id: 123,
    #     student_id: 456
    #   }
    # }
    
    # JBuilder template:
    # json.(@course, Course.attribute_names)
    # json.course_enrollment do
    #   @course_enrollment = @course.enrollments.find_by(user_id: current_user.id)
    #   json.(@course_enrollment, CourseEnrollment.attribute_names)
    # end
  end
  
  def update
    @course = Course.find_by_id(params[:id])
    return render json: "This course does not exist" if @course.nil?
    if @course.update_attributes(course_params)
      render json: @course
    else
      render json: @course.errors.full_messages, status: :unprocessable_entity
    end
  end    
  
  def index
    render json: Course.all
  end
  
  def destroy
    @course = Course.find_by_id(params[:id])
    return render json: "This course does not exist" if @course.nil?
    @course.destroy!
    render json: @course
  end
  
  def course_params
    params.require(:course).permit(:name, :code, :start_date, :end_date, :hours)
  end
end
