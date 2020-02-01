require 'rails_helper'

RSpec.describe "Invoice relationships" do
  before(:each) do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @invoice = create(:invoice, customer_id: @customer.id, merchant_id: @merchant.id)
  end

  it "can load the associated items" do
    transaction = create(:transaction, invoice_id: @invoice.id)
    transaction_1 = create(:transaction, invoice_id: @invoice.id)

    get "/api/v1/invoices/#{@invoice.id}/transactions"
    expect(response).to be_successful

    transaction_hash = JSON.parse(response.body)
    expect(transaction_hash['data'].first['attributes']['invoice_id']).to eq(@invoice.id)
    expect(transaction_hash['data'].count).to eq(2)
  end

  it "can load a collection of items associated with one invoice" do
    item = create(:item, merchant_id: @merchant.id)
    item_1 = create(:item, merchant_id: @merchant.id)
    invoice_item = create(:invoice_item, item_id: item.id, invoice_id: @invoice.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: @invoice.id)

    get "/api/v1/invoices/#{@invoice.id}/items"
    expect(response).to be_successful

    items_hash = JSON.parse(response.body)
    expect(items_hash['data'].first['attributes']['id']).to eq(item.id)
    expect(items_hash['data'].second['attributes']['id']).to eq(item_1.id)
  end

  it "can load a collection of invoice_items associated with one invoice" do
    item = create(:item, merchant_id: @merchant.id)
    item_1 = create(:item, merchant_id: @merchant.id)
    invoice_item = create(:invoice_item, item_id: item.id, invoice_id: @invoice.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: @invoice.id)

    get "/api/v1/invoices/#{@invoice.id}/invoice_items"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items['data'].first['attributes']['id']).to eq(invoice_item.id)
    expect(invoice_items['data'].second['attributes']['id']).to eq(invoice_item_1.id)
  end

  it "can load the associated customer" do
    get "/api/v1/invoices/#{@invoice.id}/customer"
    expect(response).to be_successful

    customer_hash = JSON.parse(response.body)
    expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
  end

  it "can load the associated merchant" do
    get "/api/v1/invoices/#{@invoice.id}/merchant"
    expect(response).to be_successful

    merchant_hash = JSON.parse(response.body)
    expect(merchant_hash['data']['attributes']['id']).to eq(@merchant.id)
  end
end
