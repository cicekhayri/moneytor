class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :is_admin
  helper_method :get_current_month_purchases
  helper_method :get_previous_month_purchases
  helper_method :column_chart_all_months
  helper_method :get_month
  helper_method :pie_chart_current_month

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

  def pie_chart_current_month
    Purchase.group(:product).where(user_id: current_user.id).where("purchase_date BETWEEN ? AND ?", @beginning_current_month.beginning_of_month, @beginning_current_month.end_of_month).sum(:amount)
  end

  def get_current_month_purchases
    Purchase.where(user_id: current_user.id).where("purchase_date BETWEEN ? AND ?", @beginning_current_month.beginning_of_month, @beginning_current_month.end_of_month).sum(:amount)
  end

  def get_previous_month_purchases
    Purchase.where(user_id: current_user.id).where("purchase_date BETWEEN ? AND ?", @beginning_previous_month, @beginning_current_month.beginning_of_month-1.day).sum(:amount)
  end

  def column_chart_all_months
    Purchase.where(user_id: current_user.id).group_by_month(:purchase_date,format: "%B").group(:product).sum(:amount)
  end
  
  def get_month
    @beginning_current_month = params[:month].try(:to_date) || Date.current.beginning_of_month
    @date_range = (@beginning_current_month.beginning_of_month..@beginning_current_month.end_of_month) 
    @beginning_next_month     = (@beginning_current_month + 1.month).beginning_of_month.to_s
    @beginning_previous_month = (@beginning_current_month - 1.month).beginning_of_month.to_s      
  end
end
