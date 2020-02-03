require 'rails_helper'

RSpec.describe Customer do
  describe "relationships" do
    it { should have_many :invoices }
  end

  describe "customer model methods" do

  before(:each) do
    @merchant_1 = create(:merchant)
    customer_1 = create(:customer)
    @customer_2 = create(:customer)
    customer_3 = create(:customer)
    item_1 = create(:item, merchant_id: @merchant_1.id)
    item_2 = create(:item, merchant_id: @merchant_1.id)
    item_3 = create(:item, merchant_id: @merchant_1.id)
    item_4 = create(:item, merchant_id: @merchant_1.id)

    invoice = create(:invoice, customer_id: @customer_2.id, merchant_id: @merchant_1.id)
    transaction = create(:transaction, invoice_id: invoice.id)

    @merchant_1.items.each do | item |
      create(:invoice_item, invoice_id: invoice.id)
    end
  end

    it "can find favorite customer associated with a merchant" do
      expect(Customer.merchant_transactions(@merchant_1.id)).to eq([@customer_2])
    end

    it "can find a favorite merchant associated with a customer" do
      expect(Customer.customer_merchant_transactions(@customer_2.id)).to eq([@merchant_1])
    end
  end
end
