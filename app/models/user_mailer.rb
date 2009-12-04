class UserMailer < ActionMailer::Base
  
  def message(user, mail_subject, mail_body)
    recipients user.email
    from "ilmo2@example.com"
    subject mail_subject
    body :user => user, :mail_body => mail_body
  end

end
