class ExerciseGroupsController < ApplicationController
  
  def new
    @course_instance = CourseInstance.find params[:course_instance_id]
    @exercise_group = ExerciseGroup.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exercise_group }
    end
  end

  def create
    @exercise_group = ExerciseGroup.new params[:exercise_group]
    @exercise_group.course_instance_id = params[:course_instance_id]
    
    respond_to do |format|
      if @exercise_group.save
        flash[:msg] = :group_successful
        format.html { redirect_to course_instance_url(params[:course_instance_id]) }
        format.xml  { render :xml => @exercise_group, :status => :created, :location => exercise_group }
      else
        flash[:notice] = :group_unsuccessful
        format.html { render :action => "new" }
        format.xml  { render :xml => @exercise_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @exercise_groups = ExerciseGroup.all
  end

  def show
    @exercise_group = ExerciseGroup.find params[:id]
  end

end
