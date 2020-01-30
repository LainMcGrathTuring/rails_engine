FactoryBot.define do
  factory :transaction do
    id { 1 }
    credit_card_number { "4654405418249632" }
    credit_card_expiration_date { ""}
    result { "success" }
    invoice_id { 2 }
  end
end
