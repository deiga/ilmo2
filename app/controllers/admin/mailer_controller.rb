class Admin::MailerController < AdminController
  
  def show
    
  end
  
  def create
    @users = User.with_email
    
    @users.each do |user|
      UserMail.deliver_group_mail(user, params[:subject], params[:body])
    end
    
  end
end
