# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'faker'

User.create(email: 'hayri@test.com', password: 'test232A', password_confirmation: 'test232A')

Category.create(user_id: 1, title: "Car")
Category.create(user_id: 1, title: "Clothes & Shoes")
Category.create(user_id: 1, title: "Eating Out & Coffee")
Category.create(user_id: 1, title: "Education")
Category.create(user_id: 1, title: "Entertainment")
Category.create(user_id: 1, title: "Food/Groceries")
Category.create(user_id: 1, title: "Gas/Transportation")
Category.create(user_id: 1, title: "Holiday")
Category.create(user_id: 1, title: "Home")
Category.create(user_id: 1, title: "Insurance")
Category.create(user_id: 1, title: "Kids")
Category.create(user_id: 1, title: "Medical")
Category.create(user_id: 1, title: "Taxes")
Category.create(user_id: 1, title: "Rent")
Category.create(user_id: 1, title: "Utilities/Phone/TV/Internet")

1000.times do 
  Purchase.create(user_id: 1, category_id: rand(1..14), product: Faker::Commerce.product_name, store_name: Faker::Company.name, purchase_date: Date.today - Faker::Number.number(3).to_i.days , amount: Faker::Commerce.price)
end

50.times do
  Purchase.create(user_id: 1, category_id: rand(1..14), product: Faker::Commerce.product_name, store_name: Faker::Company.name, purchase_date: Date.today , amount: Faker::Commerce.price)
end
