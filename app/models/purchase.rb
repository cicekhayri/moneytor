class Purchase < ActiveRecord::Base
  validates :product, presence: true
  belongs_to :user
  belongs_to :category

  self.per_page = 30

  def self.search(query)
    where("product LIKE ? OR store_name LIKE ?", "%#{query}%", "%#{query}%") 
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["Product", "Amount", "Purchase Date", "Store"]
      all.each do |item|
        csv << [item.product, item.amount, item.purchase_date, item.store_name]
      end
    end
  end

end
