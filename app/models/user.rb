class User < ActiveRecord::Base
  has_secure_password
  has_many :categories
  has_many :purchases

  validates :email, presence: true, uniqueness: true
 
end
