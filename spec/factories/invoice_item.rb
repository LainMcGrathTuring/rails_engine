FactoryBot.define do
  factory :invoice_item do
    sequence(:id) { |n| n }
    quantity { 4 }
    unit_price { "0.55" }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
    invoice
    item
  end
end
