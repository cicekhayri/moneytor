class Purchase < ActiveRecord::Base
  validates :product, presence: true
  belongs_to :user
  belongs_to :category

  def self.search(query)
    where("product LIKE ? OR store_name LIKE ?", "%#{query}%", "%#{query}%") 
  end


end
