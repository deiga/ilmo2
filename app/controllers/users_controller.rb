class UsersController < ApplicationController

  skip_before_filter :authentication_required, :only => [ :index, :new, :create ]
  
  def new
  end
  
  def edit
    @user = current_user
    @registered_groups = @user.exercise_groups
  end
  
  def create
    user = User.create params[:user]
    
    if user.errors.size == 0
      flash[:msg] = t :account_created
      redirect_to login_url
    else
      flash[:notice] = t :account_not_created
      render :action => "new"
    end
  end
  
  def update
    user = User.find params[:id]
    
    if user.update_attributes(params[:user])
      flash[:msg] = t :update_successful
      redirect_to root_url
    else
      flash[:notice] = t :update_unsuccessful
      render :action => 'edit'
    end
  end
  
  def destroy
    user_to_destroy = current_user
    log_user_out!
    user_to_destroy.destroy
    redirect_to login_url
  end

end
