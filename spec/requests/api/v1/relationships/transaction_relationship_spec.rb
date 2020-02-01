require 'rails_helper'

RSpec.describe "Transaction relationships" do
  it "can load the associated invoice" do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    invoice_hash = JSON.parse(response.body)
    expect(invoice_hash['data']['attributes']['id']).to eq(invoice.id)
  end
end
