FactoryGirl.define do
  factory :user do
    sequence(:email)   { |n| "person_#{n}@example.com" }
    password "foobartoo"
    password_confirmation "foobartoo"
  end

  factory :post do
    sequence(:title) { |n| "Course number #{n}" }
    body "Hello World!!!"
    user  
  end
end
