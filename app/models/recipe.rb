class Recipe < ActiveRecord::Base
  validates :product, presence: true
  
end
