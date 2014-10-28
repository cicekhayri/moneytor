class User < ActiveRecord::Base
  has_secure_password
  has_many :categories
  has_many :purchases

  validates :email, presence: true, uniqueness: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
end
