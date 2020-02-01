FactoryBot.define do
  factory :merchant do
    sequence(:id) { |n| n }
    name { "Schroeder-Jerde" }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
  end
end
