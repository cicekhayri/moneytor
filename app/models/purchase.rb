class Purchase < ActiveRecord::Base
  validates :product, presence: true
  belongs_to :user
  belongs_to :category

  def self.search(query)
    where("product LIKE ? OR store_name LIKE ?", "%#{query}%", "%#{query}%") 
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
