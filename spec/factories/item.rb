FactoryBot.define do
  factory :item do
    sequence(:id) { |n| n }
    name { "Item Labore Eius" }
    description { "Non id aperiam sunt aut distinctio non quia. Placeat dignissimos nisi atque impedit officiis. Odio aliquam rem magni. A doloribus magni magnam nobis qui iste. A odio unde tenetur." }
    unit_price { "387.16" }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
    merchant
  end
end
