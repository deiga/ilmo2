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
      format.mp3  { send_data Course.talk_course_names(@courses) }
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
  
end
