class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :product
      t.date :purchase_date
      t.integer :amount
      t.string :store_name

      t.timestamps
    end
  end
end
