require 'rails_helper'

RSpec.describe Customer do
  describe "visiting customer pages" do
    before(:each) do
      @customer = create(:customer)
      @customer_2 = create(:customer)
      # @invoice = create(:invoice, id: @customer.id)
      # @invoice_1 = create(:invoice, id: @customer.id)
    end

    it "can visit a customer show page" do
      get "/api/v1/customers/#{@customer.id}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer index page" do
      get "/api/v1/customers"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data'].count).to eq(2)
    end

    it "can visit a customer with id query params" do
      get "/api/v1/customers/find?id=#{@customer.id}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with first_name query params" do
      get "/api/v1/customers/find?first_name=#{@customer.first_name}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with last_name query params" do
      get "/api/v1/customers/find?last_name=#{@customer.last_name}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with created_at query params" do
      get "/api/v1/customers/find?created_at=#{@customer.created_at}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with updated_at query params" do
      get "/api/v1/customers/find?updated_at=#{@customer.updated_at}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with find_all id query params" do
      get "/api/v1/customers/find?id=#{@customer.id}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with find_all first_name query params" do
      get "/api/v1/customers/find?first_name=#{@customer.first_name}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with find_all last_name query params" do
      get "/api/v1/customers/find?last_name=#{@customer.last_name}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with find_all created_at query params" do
      get "/api/v1/customers/find?created_at=#{@customer.created_at}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end

    it "can visit a customer with find_all updated_at query params" do
      get "/api/v1/customers/find?updated_at=#{@customer.updated_at}"
      expect(response).to be_successful

      customer_hash = JSON.parse(response.body)
      expect(customer_hash['data']['attributes']['id']).to eq(@customer.id)
    end
  end
end
