require 'rails_helper'

RSpec.describe InvoiceItem do
  describe "visiting invoice items pages" do
    before(:each) do
      @invoice_item = create(:invoice_item)
      @invoice_item_1 = create(:invoice_item)
    end

    it "can visit an invoiceitem show page" do
      get "/api/v1/invoice_items/#{@invoice_item.id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)
    end

    it "can visit an invoiceitem index page" do
      get "/api/v1/invoice_items"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].count).to eq(2)
    end

    it "can visit an invoiceitem by find query_parameters id" do
      get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)

      get "/api/v1/invoice_items/find?id=#{@invoice_item_1.id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find query_parameters item_id" do
      get "/api/v1/invoice_items/find?item_id=#{@invoice_item.item_id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)

      get "/api/v1/invoice_items/find?item_id=#{@invoice_item_1.item_id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find query_parameters invoice_id" do
      get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item.invoice_id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)

      get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item_1.invoice_id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find query_parameters quantity" do
      get "/api/v1/invoice_items/find?quantity=#{@invoice_item.quantity}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data']['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find query_parameters unit_price" do
      get "/api/v1/invoice_items/find?unit_price=#{@invoice_item.unit_price}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data']['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find query_parameters created_at" do
      get "/api/v1/invoice_items/find?created_at=#{@invoice_item.created_at}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data']['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find query_parameters updated_at" do
      get "/api/v1/invoice_items/find?updated_at=#{@invoice_item.updated_at}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data']['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data']['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find_all query_parameters id" do
      get "/api/v1/invoice_items/find_all?id=#{@invoice_item.id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].first['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data'].first['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find_all query_parameters item_id" do
      get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item.item_id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].first['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data'].first['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find_all query_parameters invoice_id" do
      get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item.invoice_id}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].first['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data'].first['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find_all query_parameters quantity" do
      get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item.quantity}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].first['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data'].first['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find_all query_parameters unit_price" do
      get "/api/v1/invoice_items/find_all?unit_price=#{@invoice_item.unit_price}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].first['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data'].first['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find_all query_parameters created_at" do
      get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item.created_at}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].first['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data'].first['attributes']['id']).to_not eq(@invoice_item_1.id)
    end

    it "can visit an invoiceitem by find_all query_parameters updated_at" do
      get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item.updated_at}"
      expect(response).to be_successful
      invoice_item = JSON.parse(response.body)
      expect(invoice_item['data'].first['attributes']['id']).to eq(@invoice_item.id)
      expect(invoice_item['data'].first['attributes']['id']).to_not eq(@invoice_item_1.id)
    end
  end
end
