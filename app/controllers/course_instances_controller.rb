class CourseInstancesController < ApplicationController
  
  def show
    @course_instance = CourseInstance.find params[:id]
  end

end
