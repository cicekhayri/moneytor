FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| "person#{i}@example.com"}
    password 'pass222'
    password_confirmation 'pass222'
  end
end
