FactoryBot.define do
  factory :invoice do
    id { 1 }
    customer_id { 2 }
    merchant_id { 2 }
    status { "shipped" }
  end
end
