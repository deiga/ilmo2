class RegistrationsController < ApplicationController
  
  def create
    reg = Registration.create :user_id => current_user, :exercise_group_id => params[:exercise_group_id]
    if reg.errors.any?
      reg.errors.full_messages.each do |msg|
        flash[:notice] = msg
      end
    end
    redirect_to exercise_group_url(params[:exercise_group_id])
  end
  
  def destroy
    reg = Registration.find_by_user_id_and_exercise_group_id(params[:user_id], params[:group_id])
    reg.delete
    redirect_to edit_user_url(current_user)
  end
end
