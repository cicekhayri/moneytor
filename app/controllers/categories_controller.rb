class CategoriesController < ApplicationController
  before_filter :get_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_user.categories
    @categories = @categories.order(title: :asc)
    @categories = @categories.paginate(page: params[:page])
  end

  def show
    @purchases = @category.purchases
    @purchases = @purchases.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params.merge(user_id: current_user.id))

    if @category.save
      flash[:notice] = "Category saved successfully"
      redirect_to categories_path
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
    redirect_to categories_path
  end
  
  private
  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
