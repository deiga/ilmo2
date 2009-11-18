class CourseInstancesController < ApplicationController
  def show
    @ci = CourseInstance.find params[:id]
  end
  
  def new
    @course = Course.find(params[:course_id])
    @course_instance = CourseInstance.new
  end
  
  def update
  end

  def create
    par = params[:course_instance]
    ci = CourseInstance.new :season => par[:season], :year => par[:year].to_i, :description => par[:description], :course_id => par[:course_id].to_i
    if request.post? 
      if ci.save
        flash[:msg] = "Course instance created successfully"
        redirect_to course_url(params[:course_instance][:course_id])
      else
        flash[:notice] = "Creation unsuccessful"
        redirect_to new_course_instance_url
      end
    end
  end

  def destroy
  end

end
