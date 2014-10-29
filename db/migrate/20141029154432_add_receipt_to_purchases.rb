class AddReceiptToPurchases < ActiveRecord::Migration
  def change
    add_attachment :purchases, :receipt
  end
end
