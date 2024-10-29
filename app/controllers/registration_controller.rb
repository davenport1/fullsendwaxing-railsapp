class RegistrationController < ApplicationController
  allow_unauthenticated_access
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false

    unless @user.save
      start_new_session_for(@user)
      redirect_to root_path, notice: "Signed up successfully"
      return
    end

    render :new, status: :unprocessable_content
  end

  def user_params
    params.expect(user: [ :email_address, :password, :password_confirmation, :first_name, :last_name ])
  end
end
