class PurchasesController < ApplicationController
  before_filter :get_purchase, only: [:edit, :update, :show, :destroy] 

  def index
    @purchases = current_user.purchases
    @purchases = @purchases.search(params[:search]) if params[:search]
    @purchases = @purchases.order(purchase_date: :desc)

    respond_to do |format|
      format.html { @purchases = @purchases.paginate(page: params[:page]) }
      format.csv { send_data @purchases.to_csv(col_sep: "\t") }
      format.xls { send_data @purchases.to_csv }
    end
  end

  def new
    @purchase = Purchase.new    
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user

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
    redirect_to purchases_path
  end
  
  private
  def get_purchase
    @purchase = Purchase.find(params[:id]) 
    redirect_to purchases_path if :show
  end

  def purchase_params
    params.require(:purchase).permit(:purchase_date, :product, :amount, :store_name, :receipt, :category_id)
  end
end
