class UsersController < ApplicationController

  skip_before_filter :authentication_required  
  
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def edit
    #if params[:id].to_i != current_user
     # flash[:notice] = 'You are not allowed to edit other users!'
      #redirect_to root_url
#    end
    @user = User.find params[:id]
  end
  
  def update

    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      flash[:msg] = t :account_updated
      redirect_to root_url
    else
      flash[:notice] = t :update_unsuccessful
      redirect_to edit_user_url params[:id]
    end
  end
  
  def destroy
    log_user_out!
    current_user.destroy
    redirect_to login_url
  end

  def create
    @user = User.new params[:user]
    
    respond_to do |format|
      if @user.save
        flash[:msg] = t :account_created
        format.html { redirect_to login_url }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        flash[:notice] = t :account_not_created
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

end
