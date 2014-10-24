class AddCategoryToUser < ActiveRecord::Migration
  def change
    add_index :category, :user_id
  end
end
