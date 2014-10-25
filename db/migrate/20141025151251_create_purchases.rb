class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :product
      t.date :purchase_date
      t.float :amount
      t.string :store_name

      t.timestamps
    end
  end
end
