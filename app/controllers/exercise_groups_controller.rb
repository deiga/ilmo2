class ExerciseGroupsController < ApplicationController
  
  def new
    @ci = CourseInstance.find params[:instance_id]
    @eg = ExerciseGroup.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

end
