require 'rails_helper'

RSpec.describe "Merchant relationships" do
  before(:each) do
    @merchant = create(:merchant)
  end

  it "can load a collection of items associated with a merchant" do
    item = create(:item, merchant_id: @merchant.id)
    item_1 = create(:item, merchant_id: @merchant.id)
    item_2 = create(:item, merchant_id: @merchant.id)
    item_3 = create(:item, merchant_id: @merchant.id)

    get "/api/v1/merchants/#{@merchant.id}/items"
    expect(response).to be_successful

    items_hash = JSON.parse(response.body)
    expect(items_hash['data'].count).to eq(4)
    expect(items_hash['data'].first['attributes']['id']).to eq(item.id)
    expect(items_hash['data'].second['attributes']['id']).to eq(item_1.id)
    expect(items_hash['data'].third['attributes']['id']).to eq(item_2.id)
    expect(items_hash['data'].fourth['attributes']['id']).to eq(item_3.id)
  end

  it "can load a collection of invoices associated with a merchant" do
    invoice = create(:invoice, merchant_id: @merchant.id)
    invoice_1 = create(:invoice, merchant_id: @merchant.id)
    invoice_2 = create(:invoice, merchant_id: @merchant.id)

    get "/api/v1/merchants/#{@merchant.id}/invoices"

    invoice_hash = JSON.parse(response.body)

    expect(invoice_hash['data'].count).to eq(3)
    expect(invoice_hash['data'].first['attributes']['id']).to eq(invoice.id)
    expect(invoice_hash['data'].second['attributes']['id']).to eq(invoice_1.id)
    expect(invoice_hash['data'].third['attributes']['id']).to eq(invoice_2.id)
  end
end
