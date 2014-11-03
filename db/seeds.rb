# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
beginning = Time.now
require 'faker'

User.delete_all
Category.delete_all
Purchase.delete_all

ActiveRecord::Base.transaction do
  user = User.create(email: 'moneytor@test.com', password: 'moneytor', password_confirmation: 'moneytor')

  user.categories.create title: 'Car'
  user.categories.create title: 'Clothers & Shoes'
  user.categories.create title: 'Eating out & Coffe'
  user.categories.create title: 'Education'
  user.categories.create title: 'Entertainment'
  user.categories.create title: 'Food/Groceries'
  user.categories.create title: 'Gas/Transportation'
  user.categories.create title: 'Holiday'
  user.categories.create title: 'Home'
  user.categories.create title: 'Insurance'
  user.categories.create title: 'Kids'
  user.categories.create title: 'Medical'
  user.categories.create title: 'Taxes'
  user.categories.create title: 'Rent'

  1000.times do 
    user.purchases.create(category: Category.all.sample, product: Faker::Commerce.product_name, store_name: Faker::Company.name, purchase_date: Date.today - Faker::Number.number(3).to_i.days , amount: Faker::Commerce.price)
  end

  50.times do
    user.purchases.create(category: Category.all.sample, product: Faker::Commerce.product_name, store_name: Faker::Company.name, purchase_date: Date.today, amount: Faker::Commerce.price)
  end
end

alltime = Time.now - beginning
puts "All time: #{alltime}"
