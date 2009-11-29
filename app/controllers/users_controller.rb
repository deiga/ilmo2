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
    if params[:id].to_i != (session[:user][:id])
      flash[:notice] = 'You are not allowed to edit other users!'
      redirect_to root_url
    end
    @user = User.find session[:user][:id]
  end
  
  def update

    if request.put?
      user = User.find params[:id]
      user.realname = params[:user][:realname]
      user.studentnumber = params[:user][:studentnumber]
      if user.studentnumber.empty?
        user.studentnumber = nil
      end
      if params[:user][:password].length > 0
        user.password = params[:user][:password]
        user.password_confirmation = params[:user][:password_confirmation]
      end
      if user.save
        flash[:msg] = 'Account updated'
        redirect_to root_url
      else
        raise user.errors.inspect
        flash[:notice] = 'Update unsuccessful'
        redirect_to edit_user_url params[:id]
      end
    end
  end
  
  def destroy
    raise params.inspect
    User.delete params[:id]
    session[:user] = nil
    flash[:msg] = "Account removed successfully"
    redirect_to sessions_url
  end

  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        flash[:msg] = 'Account created.'
        format.html { redirect_to sessions_url }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        flash[:notice] = 'Signup unsuccessful.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

end
