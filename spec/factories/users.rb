FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.net" }
    password "password"
    password_confirmation "password"
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name 
  end
end
