require 'rails_helper'

RSpec.describe "Items relationships" do
  before(:each) do
    @item = create(:item)
    @invoice = create(:invoice, merchant_id: @item.merchant_id)
    @invoice_item = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id)
    @invoice_item_1 = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id)
  end

  it "can load a collection of invoice items associated with one item" do
    get "/api/v1/items/#{@item.id}/invoice_items"
    expect(response).to be_successful

    invoice_items_hash = JSON.parse(response.body)
    expect(invoice_items_hash['data'].first['attributes']['item_id']).to eq(@item.id)
    expect(invoice_items_hash['data'].second['attributes']['item_id']).to eq(@item.id)
  end

  it "can load the associated merchant" do
    get "/api/v1/items/#{@item.id}/merchant"
    expect(response).to be_successful

    merchant_hash = JSON.parse(response.body)
    expect(merchant_hash['data']['attributes']['id']).to eq(@item.merchant_id)
  end
end
