class Category < ActiveRecord::Base

  belongs_to :user
  has_many :purchases

  validates :title, presence: true
  validates :user, presence: true
  
  self.per_page = 30
end
