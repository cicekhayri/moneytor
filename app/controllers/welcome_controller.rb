class WelcomeController < ApplicationController
  skip_before_filter :authorize
  def index
    get_month
  end
end
