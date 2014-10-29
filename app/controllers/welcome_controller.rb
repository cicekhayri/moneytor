class WelcomeController < ApplicationController
  require 'pry'
  skip_before_filter :authorize
  
  def index
    @beginning_current_month = params[:month].try(:to_date) || Date.current.beginning_of_month
    @date_range = (@beginning_current_month.beginning_of_month..@beginning_current_month.end_of_month) 
    @beginning_next_month     = (@beginning_current_month + 1.month).beginning_of_month.to_s
    @beginning_previous_month = (@beginning_current_month - 1.month).beginning_of_month  
    if current_user
      #inding.pry
      @get_current_month_purchases = current_user.purchases.for_month(@beginning_current_month).sum(:amount)
      @get_previous_month_purchases = current_user.purchases.for_month(@beginning_previous_month).sum(:amount)
      @pie_chart_current_month = current_user.purchases.group(:product).for_month(@beginning_current_month).sum(:amount)
      @column_chart_all_months = current_user.purchases.group_by_month(:purchase_date,format: "%B").sum(:amount)
      
      @category_char = current_user.purchases.where(category_id: params[:category_id]).group(:product).sum(:amount)

      #@category_char = current_user.purchases.group_by { |p| p.purchase_date.beginning_of_month }.map { |m,ps| { m => ps.group_by(&:category).map { |c,ps| { c.title => ps.sum(&:amount) } }.inject(:merge) }}.inject(:merge) 
    end

  end


end
