class AdminController < ApplicationController
  before_action :require_authentication
  before_action :require_admin

  def home
  end
end
