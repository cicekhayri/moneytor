class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  validates :product, presence: true

  scope :search, lambda { |query| where("lower(product) LIKE ? OR lower(store_name) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%") }
  scope :for_month, lambda { |month| between(month.beginning_of_month, month.end_of_month) }
  scope :between, lambda { |beginning, finish| where("purchase_date BETWEEN ? AND ?", beginning, finish) }

  self.per_page = 30

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["Product", "Amount", "Purchase Date", "Store"]
      all.each do |item|
        csv << [item.product, item.amount, item.purchase_date, item.store_name]
      end
    end
  end

end
