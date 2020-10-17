FactoryBot.define do
  factory :goal do
    goal_title { Faker::Beer.name }
    description { Faker::Beer.yeast }
    association :user
  end
end