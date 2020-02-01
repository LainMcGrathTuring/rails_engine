require 'rails_helper'

RSpec.describe Item do
  describe "visiting merchant pages" do
    before(:each) do
      @merchant = create(:merchant)
      merchant_2 = create(:merchant, id: 3)
      item = create(:item, merchant_id: @merchant.id)
      item_2 = create(:item, id: 2, merchant_id: @merchant.id)
    end

    it "can visit a merchant show page" do
      get "/api/v1/merchants/#{@merchant.id}"
      expect(response).to be_successful

    end

    it "can visit merchant index page" do
      get "/api/v1/merchants"
      expect(response).to be_successful
      merchant_hash = JSON.parse(response.body)
      expect(merchant_hash["data"].count).to eq(2)
    end

    it "can visit with id query params" do
      get "/api/v1/merchants/find?id=#{@merchant.id}"
      expect(response).to be_successful

      merchant_hash = JSON.parse(response.body)
      expect(merchant_hash["data"]['id'].to_i).to eq(@merchant.id)
    end

    it "can visit with name query params" do
      get "/api/v1/merchants/find?name=#{@merchant.name}"
      expect(response).to be_successful

      merchant_hash = JSON.parse(response.body)
      expect(merchant_hash["data"]['id'].to_i).to eq(@merchant.id)
    end

    it "can visit with created_at query params" do
      get "/api/v1/merchants/find?created_at=#{@merchant.created_at}"
      expect(response).to be_successful

      merchant_hash = JSON.parse(response.body)
      expect(merchant_hash["data"]['id'].to_i).to eq(@merchant.id)
    end

    it "can visit with updated_at query params" do
      get "/api/v1/merchants/find?updated_at=#{@merchant.updated_at}"
      expect(response).to be_successful

      merchant_hash = JSON.parse(response.body)
      expect(merchant_hash["data"]['id'].to_i).to eq(@merchant.id)
    end

    it "can visit with id find_all query params" do
      get "/api/v1/merchants/find_all?id=#{@merchant.id}"
      expect(response).to be_successful

      merchant_hash = JSON.parse(response.body)
      expect(merchant_hash["data"].count).to eq(1)
    end

    it "can visit with name find_all query params" do
      get "/api/v1/merchants/find_all?name=#{@merchant.name}"
      expect(response).to be_successful

      merchant_hash = JSON.parse(response.body)
      expect(merchant_hash["data"].count).to eq(2)
    end
  end
end
