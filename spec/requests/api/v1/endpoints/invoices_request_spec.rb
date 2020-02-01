require 'rails_helper'

RSpec.describe Invoice do
  describe "visiting invoices pages" do
    before(:each) do
      @invoice = create(:invoice)
      @invoice_2 = create(:invoice)
    end

    it "can visit an invoice show page" do
      get "/api/v1/invoices/#{@invoice.id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data']['id'].to_i).to eq(@invoice.id)
    end

    it "can visit an invoice index page" do
      get "/api/v1/invoices"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data'].count).to eq(2)
    end

    it "can visit an invoice page with id query parameters" do
      get "/api/v1/invoices/find?id=#{@invoice.id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data']['id'].to_i).to eq(@invoice.id)
    end

    it "can visit an invoice page with customer_id query parameters" do
      get "/api/v1/invoices/find?customer_id=#{@invoice.customer_id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data']['id'].to_i).to eq(@invoice.id)
    end

    it "can visit an invoice page with merchant_id query parameters" do
      get "/api/v1/invoices/find?merchant_id=#{@invoice.merchant_id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data']['id'].to_i).to eq(@invoice.id)
    end

    it "can visit an invoice page with status query parameters" do
      get "/api/v1/invoices/find?status=#{@invoice.status}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data']['id'].to_i).to eq(@invoice.id)
    end

    it "can visit an invoice page with created_at query parameters" do
      get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data']['id'].to_i).to eq(@invoice.id)
    end

    it "can visit an invoice page with updated_at query parameters" do
      get "/api/v1/invoices/find?updated_at=#{@invoice.updated_at}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data']['id'].to_i).to eq(@invoice.id)
    end

    it "can visit an invoice page with id query parameters" do
      get "/api/v1/invoices/find_all?id=#{@invoice.id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data'].count).to eq(1)
    end

    it "can visit an invoice page with customer_id query parameters" do
      get "/api/v1/invoices/find_all?customer_id=#{@invoice.customer_id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data'].count).to eq(1)

      get "/api/v1/invoices/find_all?customer_id=#{@invoice_2.customer_id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data'].count).to eq(1)
    end

    it "can visit an invoice page with merchant_id query parameters" do
      get "/api/v1/invoices/find_all?merchant_id=#{@invoice.merchant_id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data'].count).to eq(1)

      get "/api/v1/invoices/find_all?merchant_id=#{@invoice_2.merchant_id}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data'].count).to eq(1)
    end

    it "can find all invoices by status" do
      get "/api/v1/invoices/find_all?status=#{@invoice.status}"
      expect(response).to be_successful

      invoice_hash = JSON.parse(response.body)
      expect(invoice_hash['data'].count).to eq(2)
    end
  end
end
