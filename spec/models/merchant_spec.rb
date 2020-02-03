require 'rails_helper'

RSpec.describe Merchant do
  describe "relationships" do
    it { should have_many :invoices }
    it { should have_many :items }
  end

  describe "Merchant business intelligence queries" do
    before(:each) do
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant)
      customer = create(:customer)
      item_1 = create(:item, merchant_id: @merchant_1.id, unit_price: 10)
      item_2 = create(:item, merchant_id: @merchant_1.id, unit_price: 10)
      item_3 = create(:item, merchant_id: @merchant_2.id, unit_price: 10)
      item_4 = create(:item, merchant_id: @merchant_2.id, unit_price: 10)

      invoice_1 = create(:invoice, merchant_id: @merchant_1.id, customer_id: customer.id)
      invoice_2 = create(:invoice, merchant_id: @merchant_1.id, customer_id: customer.id)
      invoice_3 = create(:invoice, merchant_id: @merchant_2.id, customer_id: customer.id)

      Invoice.all.each do |invoice|
        create(:transaction, invoice_id: invoice.id)
      end

      @merchant_1.items.each do |item|
        create(:invoice_item, invoice_id: invoice_1.id, quantity: 10, unit_price: 10)
        create(:invoice_item, invoice_id: invoice_2.id, quantity: 4, unit_price: 10)
      end

      @merchant_2.items.each do |item|
        create(:invoice_item, invoice_id: invoice_3.id, quantity: 13, unit_price: 3)
      end
    end

    it "can find the merchants with the most revenue" do
      expect(Merchant.most_revenue(2).length).to eq(2)
      expect(Merchant.most_revenue(2)).to eq([@merchant_1, @merchant_2])
    end

    it "can find the total revenue" do
      expect(Merchant.total_revenue(@merchant_1.id)).to_not eq(@merchant_2.id)
    end

    it "can find total items sold " do
      expect(Merchant.total_items_sold(1)).to eq([@merchant_1])
    end
  end
end
