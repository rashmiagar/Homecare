class Notifier < ActionMailer::Base

  def message(sub, email_body, user)
    recipients user.email
    from "rashmiagar@gmail.com"
    subject sub
    sent_on Time.now
    body email_body
  end
end
