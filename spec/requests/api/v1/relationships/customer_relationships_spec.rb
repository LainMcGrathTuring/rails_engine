require 'rails_helper'

RSpec.describe "customer relationships" do
  before(:each) do
    @customer = create(:customer)
    @invoice = create(:invoice, customer_id: @customer.id)
    @invoice_1 = create(:invoice, customer_id: @customer.id)
  end

  it "can load a collection of invoices associated with a customer" do

    get "/api/v1/customers/#{@customer.id}/invoices"

    customer_hash = JSON.parse(response.body)
    expect(customer_hash['data'].count).to eq(2)
  end

  it "can load a collection of invoices associated with a customer" do
    transaction = create(:transaction, invoice_id: @invoice.id)
    transaction_1 = create(:transaction, invoice_id: @invoice.id)
    transaction_2 = create(:transaction, invoice_id: @invoice.id)

    get "/api/v1/customers/#{@customer.id}/transactions"

    customer_hash = JSON.parse(response.body)
    expect(customer_hash['data'].count).to eq(3)
  end
end
