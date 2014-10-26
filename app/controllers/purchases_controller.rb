class PurchasesController < ApplicationController
  before_filter :get_purchase, only: [:edit, :update, :show, :destroy] 
  before_filter :authorize

  def index
    if params[:search]
      @purchases = Purchase.search(params[:search]).where(user_id: current_user.id)
    else
      @purchases = Purchase.order(purchase_date: :desc).where(user_id: current_user.id)
    end

    respond_to do |format|
      format.html
      format.csv { send_data @purchases.to_csv(col_sep: "\t") }
      format.xls { send_data @purchases.to_csv }
    end
  end

  def new
    @purchase = Purchase.new    
  end

  def show
  end

  def edit
  end

  def create
    @purchase = Purchase.new(purchase_params.merge(user_id: current_user.id))

    if @purchase.save
      flash[:notice] = "Purchase successfully added"
      redirect_to purchases_path
    else
      render :new
    end
  end

  def update
    if @purchase.update_attributes(purchase_params)
      flash[:notice] = "Purchase successfully updated"
      redirect_to purchases_path
    else
      render :edit
    end
  end

  def destroy
    @purchase.destroy
    redirect_to root_url
  end
  
  private
  def get_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:purchase_date, :product, :amount, :store_name, :category_id)
  end
end
