class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :is_admin
  helper_method :get_current_month_purchases

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      redirect_to root_url
    end
  end

  def get_current_month_purchases
    @purchase_of_month = Purchase.where(user_id: current_user.id).where("purchase_date BETWEEN ? AND ?", Date.today.beginning_of_month, Date.today.end_of_month).sum(:amount)
  end
end
