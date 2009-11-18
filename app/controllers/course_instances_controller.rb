class CourseInstancesController < ApplicationController
  def show
  end
  
  def new
    @course = Course.find(params[:course_id])
    @course_instance = CourseInstance.new
  end
  
  def update
  end

  def create
  end

  def destroy
  end

end
