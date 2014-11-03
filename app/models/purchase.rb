class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  has_attached_file :receipt, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing.png"
  validates_attachment_content_type :receipt, :content_type => /\Aimage\/.*\Z/
  
  validates :product, presence: true
  validates :user, presence: true
  validate :matching_user_with_category

  scope :search, lambda { |query| where("lower(product) LIKE ? OR lower(store_name) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%") }
  scope :for_month, lambda { |month| between(month.beginning_of_month, month.end_of_month) }
  scope :between, lambda { |beginning, finish| where("purchase_date BETWEEN ? AND ?", beginning, finish) }
  scope :for_category, lambda { |category| where(category_id: category) }

  self.per_page = 30

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["Product", "Amount", "Purchase Date", "Store"]
      all.each do |item|
        csv << [item.product, item.amount, item.purchase_date, item.store_name]
      end
    end
  end

  private

  def matching_user_with_category
    return unless category.present?

    unless user == category.user
      errors.add(:category, 'user should be the same as the purchase')
    end
  end
end
