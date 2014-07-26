class Api::CoursesController < ApplicationController
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
    render json: @course
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
