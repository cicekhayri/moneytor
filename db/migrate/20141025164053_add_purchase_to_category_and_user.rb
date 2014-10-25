class AddPurchaseToCategoryAndUser < ActiveRecord::Migration
  def change
    add_column :purchases, :category_id, :integer
    add_column :purchases, :user_id, :integer
  end
end
