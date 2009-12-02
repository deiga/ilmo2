class CourseInstancesController < ApplicationController
  
  def show
    @ci = CourseInstance.find params[:id]
    #@egroups = ExerciseGroup.find(:all, :conditions => {:course_instance_id => params[:id]}, :order => "id ASC")
  end
  
  def new
    @course = Course.find params[:course_id]
    @ci = CourseInstance.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ci }
    end
  end
  
  def update
  end

  def create
    #raise params.inspect
    par = params[:course_instance]
    @course = Course.find(par[:course_id])
    @ci = CourseInstance.new :season => get_season(params[:startdate][:month]), :description => par[:description], :course_id => par[:course_id].to_i, :start => format_year(params[:startdate]), :end => format_year(params[:enddate])
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
  
  def get_season(month)
    if month.to_i <= 5
      'Autumn'
    elsif month.to_i > 5 && month.to_i < 9
      'Summer'
    else
      'Fall'
    end
  end
  
  def format_year(date_array)
    date_array[:year]+"-"+date_array[:month]+"-"+date_array[:day]
  end

end
