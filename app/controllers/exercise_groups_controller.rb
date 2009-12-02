class ExerciseGroupsController < ApplicationController
  
  def new
    @ci = CourseInstance.find params[:instance_id]
    @eg = ExerciseGroup.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @eg }
    end
  end
  
  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end

end
