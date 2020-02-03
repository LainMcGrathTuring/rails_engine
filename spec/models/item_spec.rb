require 'rails_helper'

RSpec.describe Item do
  describe "relationships" do
    it { should belong_to :merchant }
  end

  it "can find items" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    expect(Item.query_find({"created_at" => item_1.created_at})).to eq(item_1)
    expect(Item.query_find({"updated_at" => item_1.updated_at})).to eq(item_1)
    expect(Item.query_find({"name" => item_1.name})).to eq(item_1)
    expect(Item.query_find({"merchant_id" => item_1.merchant_id,})).to eq(item_1)
    expect(Item.query_find({"unit_price" => item_1.unit_price,})).to eq(item_1)

    expect(Item.query_find({"created_at" => item_2.created_at})).to_not eq(item_2)
    expect(Item.query_find({"created_at" => item_2.created_at})).to eq(item_1)

    expect(Item.query_find({"updated_at" => item_2.updated_at})).to_not eq(item_2)
    expect(Item.query_find({"created_at" => item_2.created_at})).to eq(item_1)
  end
end
