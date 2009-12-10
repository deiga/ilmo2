class ExerciseGroupsController < ApplicationController

  def show
    @exercise_group = ExerciseGroup.find params[:id]
  end

end
