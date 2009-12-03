class CourseInstancesController < ApplicationController
  
  def index
    @course_instances = CourseInstance.all
  end
  
  def show
    @course_instances = CourseInstance.find params[:id]
  end
  
  def new
    @course = Course.find params[:course_id]
    @course_instance = CourseInstance.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_instances }
    end
  end
  
  def update
  end

  def create
    par = params[:course_instance]
    @course = Course.find(params[:course_id])
    @course_instance = CourseInstance.new :season => get_season(params[:startdate][:month]), :description => par[:description], :course => @course, :start => format_year(params[:startdate]), :end => format_year(params[:enddate])
    
    respond_to do |format|
      if @course_instance.save
        flash[:msg] = :instance_successful
        format.html { redirect_to course_url(params[:course_instance][:course_id]) }
        format.xml  { render :xml => @course_instance, :status => :created, :location => course_instance }
      else
        flash[:notice] = :instance_successful
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_instance.errors, :status => :unprocessable_entity }
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
