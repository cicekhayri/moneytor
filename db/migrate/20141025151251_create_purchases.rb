class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|

      t.timestamps
    end
  end
end
