FactoryGirl.define do
  factory :user do
    email 'user1@example.com'
    password 'pass222'
    password_confirmation 'pass222'
  end
end
