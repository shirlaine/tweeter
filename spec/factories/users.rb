FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    fullname "user one"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "123123"
  end
end
