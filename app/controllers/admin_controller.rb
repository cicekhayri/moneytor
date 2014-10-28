class AdminController < ApplicationController
  def index
    redirect_to root_path unless is_admin?
    @users = User.all
  end
end
