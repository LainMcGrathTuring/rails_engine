require 'rails_helper'

RSpec.describe "invoice items relationships" do
  before(:each) do
    @invoice = create(:invoice)
    @item = create(:item)

    @invoice_item = create(:invoice_item, item_id: @item.id)
    @invoice_item_1 = create(:invoice_item)
  end

  it "can load the associated item" do
    get "/api/v1/invoice_items/#{@invoice_item.id}/item"
    expect(response).to be_successful

    invoice_item_hash = JSON.parse(response.body)
    expect(invoice_item_hash['data']['attributes']['id']).to eq(@item.id)
  end

  it "can load the associated invoice" do
    get "/api/v1/invoice_items/#{@invoice_item.id}/invoice"
    expect(response).to be_successful

    invoice_item_hash = JSON.parse(response.body)
    expect(invoice_item_hash['data']['attributes']['id']).to eq(@invoice_item.invoice_id)

    get "/api/v1/invoice_items/#{@invoice_item_1.id}/invoice"
    expect(response).to be_successful

    invoice_item_hash = JSON.parse(response.body)
    expect(invoice_item_hash['data']['attributes']['id']).to eq(@invoice_item_1.invoice_id)
  end
end
