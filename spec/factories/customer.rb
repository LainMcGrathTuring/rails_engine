FactoryBot.define do
  factory :customer do
    sequence(:id) { |n| n }
    first_name { "Harry" }
    last_name { "Potter" }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
  end
end
