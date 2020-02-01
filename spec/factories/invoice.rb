FactoryBot.define do
  factory :invoice do
    sequence(:id) { |n| n }
    status { "shipped" }

    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
    merchant
    customer
  end
end
