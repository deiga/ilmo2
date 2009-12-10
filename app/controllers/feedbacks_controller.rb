class FeedbacksController < ApplicationController
  
  def create
    #raise params.inspect
    ci = CourseInstance.find(params[:course_instance_id])
    ci.feedbacks << Feedback.create( :message => params[:feedback][:message] )
    redirect_to course_instance_path(ci)
  end

  def destroy
  end

  def new
    #raise params.inspect
    @ci = CourseInstance.find params[:instance_id]
  end
  
end
