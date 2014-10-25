class Purchase < ActiveRecord::Base
  validates :product, presence: true
end
