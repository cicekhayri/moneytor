class UsersController < ApplicationController
  before_filter :get_user, only: [:edit, :show, :update, :destroy]
  skip_before_filter :authorize, only: [:new, :create]

  def new
    redirect_to root_path if current_user

    @user = User.new
  end

  def show
    redirect_to root_path unless current_user

    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      UserNotifier.signup_user(@user).deliver
      flash[:notice] = "Thanks for signing up"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Your information have been updated"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private
  def get_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
