FactoryBot.define do
  factory :goal do
    goal_title { 'This is my goal' }
    description { 'My goal is to complete this rspec!' }
    user
  end
end