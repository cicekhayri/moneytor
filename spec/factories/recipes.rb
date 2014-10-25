# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    product "Product name"
    purchase_date "2014-11-11"
    store_name "E-Store"
  end
end
