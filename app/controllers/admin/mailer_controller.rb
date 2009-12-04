class Admin::MailerController < AdminController
  
  def show
    @exercise_groups = ExerciseGroup.all
    
  end
  
  def create

    @exercise_group = ExerciseGroup.find_by_id params[:group][:group_id]
    @users = @exercise_group.users.with_email
    
    @users.each do |user|
      UserMailer.deliver_group_mail(user, params[:subject], params[:body])
    end
  end
  
end
