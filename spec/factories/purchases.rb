# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    product "Shoe"
    purchase_date "2014-10-10"
    amount "10.00"
    store_name "Estore"
  end
end
