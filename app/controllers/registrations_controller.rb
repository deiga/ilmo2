class RegistrationsController < ApplicationController
  
  def create
    Registration.create :user_id => current_user, :exercise_group_id => params[:exercise_group_id]
    redirect_to exercise_group_url(params[:exercise_group_id])
  end
  
end
