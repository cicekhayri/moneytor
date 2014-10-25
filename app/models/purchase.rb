class Purchase < ActiveRecord::Base
  validates :product, presence: true
  belongs_to :user
  belongs_to :category
end
