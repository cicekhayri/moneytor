class PurchasesController < ApplicationController
  before_filter :get_purchase, only: [:edit, :update, :show, :destroy] 
  
  def index
  end

  def new
    @purchase = Purchase.new
  end

  def show
  end

  def edit
  end

  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      flash[:notice] = "Purchase successfully added"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @purchase.update_attributes(purchase_params)
      flash[:notice] = "Purchase successfully updated"
      redirect_to purchase_path(@purchase)
    else
      render :edit
    end
  end
  
  private
  def get_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:purchase_date, :product, :amount, :store_name)
  end
end
