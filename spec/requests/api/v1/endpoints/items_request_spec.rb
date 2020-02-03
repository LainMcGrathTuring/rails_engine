require 'rails_helper'

RSpec.describe Item do
  describe "visiting items pages" do
    before(:each) do
      @merchant = create(:merchant)
      @item = create(:item, merchant_id: @merchant.id)
      item_2 = create(:item, id: 2, merchant_id: @merchant.id)
    end

    it "can visit an item show page" do
      get "/api/v1/items/#{@item.id}"
      expect(response).to be_successful

    end

    it "can visit item index page" do
      get "/api/v1/items"
      expect(response).to be_successful
      items_hash = JSON.parse(response.body)

      expect(items_hash["data"].count).to eq(2)
    end

    it "can visit with id query params" do
      get "/api/v1/items/find?id=#{@item.id}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"]['id'].to_i).to eq(@item.id)
    end

    it "can visit with name query params" do
      get "/api/v1/items/find?name=#{@item.name}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"]['id'].to_i).to eq(@item.id)
    end

    it "can visit with description query params" do
      get "/api/v1/items/find?description=#{@item.description}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"]['id'].to_i).to eq(@item.id)
    end

    it "can visit with unit_price query params" do
      get "/api/v1/items/find?unit_price=#{@item.unit_price}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"]['id'].to_i).to eq(@item.id)
    end

    it "can visit with merchant_id query params" do
      get "/api/v1/items/find?merchant_id=#{@item.merchant_id}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"]['id'].to_i).to eq(@item.id)
    end

    it "can visit with id find_all query params" do
      get "/api/v1/items/find_all?id=#{@item.id}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"].count).to eq(1)
    end

    it "can visit with name find_all query params" do
      get "/api/v1/items/find_all?name=#{@item.name}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"].count).to eq(2)
    end

    it "can visit with description find_all query params" do
      get "/api/v1/items/find_all?description=#{@item.description}"
      expect(response).to be_successful

      items_hash = JSON.parse(response.body)
      expect(items_hash["data"].count).to eq(2)
    end
  end
end
