class AdminController < ApplicationController
  before_action :require_admin

  def home
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to access this page"
    end
  end
end
