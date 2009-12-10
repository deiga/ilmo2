class CoursesController < ApplicationController

  def index
    params[:later_than] = 30.minutes.ago
    @courses = Course.all
    
    @swf = SWFChart.new

    session[:swfchart] = @swf
    #set data headings
    @swf.data_array = Array.new
    @swf.data_array[0] = [nil]
    @swf.data_array[1] = ['']

    #get course count per category
    Category.all.each do |category|
      @swf.data_array[0] << category.name
      @swf.data_array[1] << category.courses.size
    end
    @swf.chart_type = "3d pie"
    @swf.chart_rect = {:x => '150',:width => '200',:height => '125'}
    @swf.legend_rect = {:x => 10, :y => 10, :width => 50, :height => 200}

    respond_to do |format|
      format.html # index.html.erb
      format.rss
      format.mp3 { send_data Course.talk_course_names(@courses) }
      format.json
      format.xml  { render :xml => @courses }
      format.pdf  { send_data PdfExport.all_courses(@courses) }
    end
  end

  def show
    @course = Course.find params[:id] 
    @course_instances = CourseInstance.find_by_course_in_order @course.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:msg] = :course_successful
        format.html { redirect_to(@course) }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        flash[:notice] = :course_unsuccessful
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:notice] = 'Course was successfully updated.'
        format.html { redirect_to(@course) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end
  
end
