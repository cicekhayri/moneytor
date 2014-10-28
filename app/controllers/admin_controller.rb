class AdminController < ApplicationController
  def index
    if current_user && current_user.admin
      @users = User.all
    else
      redirect_to root_path
    end
  end
end
