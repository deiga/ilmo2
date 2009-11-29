class CourseInstancesController < ApplicationController
  
  def show
    @ci = CourseInstance.find params[:id]
  end
  
  def new
    @course = Course.find(params[:course_id])
    @ci = CourseInstance.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ci }
    end
  end
  
  def update
  end

  def create
#    raise params.inspect
    par = params[:course_instance]
    @course = Course.find(par[:course_id])
    @ci = CourseInstance.new :season => par[:season], :year => par[:year].to_i, :description => par[:description], :course_id => par[:course_id].to_i
    respond_to do |format|
      if @ci.save
        flash[:msg] = 'Course instance created successfully'
        format.html { redirect_to course_url(params[:course_instance][:course_id]) }
        format.xml  { render :xml => @ci, :status => :created, :location => ci }
      else
        flash[:notice] = "Creation unsuccessful"
        format.html { render :action => "new" }
        format.xml  { render :xml => @ci.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  end

end
