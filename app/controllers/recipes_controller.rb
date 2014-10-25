class RecipesController < ApplicationController
  before_filter :get_recipe, only: [:edit, :update, :show, :destroy] 
  
  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = "Recipe successfully added"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def get_recipe
    @recipe = Recipe.find(params[:recipe])
  end

  def recipe_params
    params.require(:recipe).permit(:purchase_date, :product, :amount, :store_name)
  end
end
