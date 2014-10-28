class WelcomeController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @beginning_current_month = params[:month].try(:to_date) || Date.current.beginning_of_month
    @date_range = (@beginning_current_month.beginning_of_month..@beginning_current_month.end_of_month) 
    @beginning_next_month     = (@beginning_current_month + 1.month).beginning_of_month.to_s
    @beginning_previous_month = (@beginning_current_month - 1.month).beginning_of_month  

    @get_current_month_purchases = current_user.purchases.for_month(@beginning_current_month).sum(:amount)
    @get_previous_month_purchases = current_user.purchases.for_month(@beginning_previous_month).sum(:amount)
    @pie_chart_current_month = current_user.purchases.group(:product).for_month(@beginning_current_month).sum(:amount)
    @column_chart_all_months = current_user.purchases.group_by_month(:purchase_date,format: "%B").group(:category_id).sum(:amount)
  end
end
