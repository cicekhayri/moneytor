class CategoriesController < ApplicationController

  def new
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
  def category_params
    params.require(:category).permit(:title)
  end

end
