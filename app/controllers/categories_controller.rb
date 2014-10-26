class CategoriesController < ApplicationController
  before_filter :get_category, only: [:show, :edit, :update, :destroy]
  before_filter :authorize 

  def index
    @categories = Category.order(title: :asc).where(user_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def show
  end

  def edit
  end

  def create
    @category = Category.new(category_params.merge(user_id: current_user.id))

    if @category.save
      flash[:notice] = "Category saved successfully"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = "Category successfully updated"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_url
  end
  
  private
  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
