class UserMailer < ActionMailer::Base
  
  def group_mail(user, mail_subject, mail_body)
    recipients user.email
    from "My Awesome Site Notifications <notifications@example.com>"
    subject mail_subject
    sent_on Time.now
    body :user => user, :mail_body => mail_body
  end

end
