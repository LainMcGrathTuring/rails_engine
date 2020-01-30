FactoryBot.define do
  factory :invoice_item do
    id { 1 }
    invoice_id { 1 }
    item_id { 1 }
    quantity { 4 }
    unit_price { "0.55" }
  end
end
