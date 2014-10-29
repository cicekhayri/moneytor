class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize 
  before_action :set_locale

  helper_method :current_user
  helper_method :is_admin?

  def current_user 
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])  
    end
  end

  def is_admin?
    if current_user && current_user.admin == true
      return true
    else
      return false
    end
  end

  def authorize
    if !current_user
      redirect_to root_url
    end
  end 
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})
    { locale: I18n.locale }
  end
end
