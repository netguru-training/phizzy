FactoryGirl.define do
  factory :exercise do
    name Faker::Lorem.word.capitalize
    description Faker::Lorem.paragraph
  end

end
