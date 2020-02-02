require 'rails_helper'

RSpec.describe "Most Reveue Query" do
  it "can find most revenue by number of records" do
    merchant = create(:merchant)
    merchant_1 = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant_1.id)
    item_1 = create(:item, merchant_id: merchant_1.id)
    item_2 = create(:item, merchant_id: merchant_1.id)
    item_3 = create(:item, merchant_id: merchant_1.id)

    merchant_1.items.each do |item|
      create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
    end

    create(:transaction, invoice_id: invoice.id)

    get "/api/v1/merchants/most_revenue?quantity=2"
    expect(response).to be_successful

    merchant_hash = JSON.parse(response.body)
    expect(merchant_hash['data'].first['id']).to eq("#{merchant_1.id}")
  end
end
