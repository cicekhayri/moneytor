class CategoriesController < ApplicationController
  before_filter :get_category, only: [:show, :update, :destroy]

  def new
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category saved successfully"
      redirect_to root_url
    else
      render :new
    end
  end
  
  private
  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
