class ContactMailer < ApplicationMailer
  default from: "alec@fullsendwaxing.com"

  def contact_email(name, email, message)
    @name = name
    @message = message
    @reply_to = email
    mail(to: "alec@fullsendwaxing.com", subject: "New Contact Us Message From #{name}", reply_to: email)
  end
end
