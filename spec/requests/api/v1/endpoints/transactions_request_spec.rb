require 'rails_helper'


RSpec.describe Transaction do
  describe "visiting transaction pages" do
    before(:each) do

      @transaction = create(:transaction)
      @transaction_1 = create(:transaction)
    end

    it "can visit a transaction show page" do
      get "/api/v1/transactions/#{@transaction.id}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data']['attributes']['id']).to eq(@transaction.id)
    end

    it "can visit a transaction index page" do
      get "/api/v1/transactions"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data'].count).to eq(2)
    end

    it "can visit a transaction page by query params invoice_id" do
      get "/api/v1/transactions/find?invoice_id=#{@transaction.invoice_id}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data']['attributes']['id']).to eq(@transaction.id)
      expect(transaction_hash['data']['attributes']['id']).to_not eq(@transaction_1.id)
    end

    it "can visit a transaction page by cc number" do
      get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data']['attributes']['id']).to eq(@transaction.id)
      expect(transaction_hash['data']['attributes']['id']).to_not eq(@transaction_1.id)

    end

    it "can visit a transaction page by result" do
      get "/api/v1/transactions/find?result=#{@transaction.result}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data']['attributes']['id']).to eq(@transaction.id)
      expect(transaction_hash['data']['attributes']['id']).to_not eq(@transaction_1.id)

    end

    it "can visit a transaction page by result" do
      get "/api/v1/transactions/find?result=#{@transaction.result}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data']['attributes']['id']).to eq(@transaction.id)
      expect(transaction_hash['data']['attributes']['id']).to_not eq(@transaction_1.id)
    end

    it "can visit a transaction page by created_at" do
      get "/api/v1/transactions/find?created_at=#{@transaction.created_at}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data']['attributes']['id']).to eq(@transaction.id)
      expect(transaction_hash['data']['attributes']['id']).to_not eq(@transaction_1.id)
    end

    it "can visit a transaction page by updated_at" do
      get "/api/v1/transactions/find?updated_at=#{@transaction.updated_at}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data']['attributes']['id']).to eq(@transaction.id)
      expect(transaction_hash['data']['attributes']['id']).to_not eq(@transaction_1.id)
    end

    it "can visit a transaction page by find_all invoice_id" do
      get "/api/v1/transactions/find_all?invoice_id=#{@transaction.invoice_id}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data'].first['attributes']['id']).to eq(@transaction.id)
      expect(transaction_hash['data'].first['attributes']['id']).to_not eq(@transaction_1.id)
    end

    it "can visit a transaction page by find_all credit_card_number" do
      get "/api/v1/transactions/find_all?credit_card_number=#{@transaction.credit_card_number}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data'].count).to eq(2)
    end

    it "can visit a transaction page by find_all result" do
      get "/api/v1/transactions/find_all?result=#{@transaction.result}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data'].count).to eq(2)
    end

    it "can visit a transaction page by find_all updated_at" do
      get "/api/v1/transactions/find_all?updated_at=#{@transaction.updated_at}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data'].count).to eq(2)
    end

    it "can visit a transaction page by find_all created_at" do
      get "/api/v1/transactions/find_all?created_at=#{@transaction.created_at}"
      expect(response).to be_successful

      transaction_hash = JSON.parse(response.body)
      expect(transaction_hash['data'].count).to eq(2)
    end
  end
end
