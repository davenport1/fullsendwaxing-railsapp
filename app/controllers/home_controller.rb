class HomeController < ApplicationController
  allow_unauthenticated_access
  invisible_captcha only: [ :send_contact ], honeypot: :subtitle
  def index
  end

  def about
  end

  def contact
  end

  def services
  end

  def send_contact
    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.contact_email(name, email, message)
                 .deliver_now
    flash[:success] = "Your message has been sent!"
    redirect_to home_contact_path
  end
end
