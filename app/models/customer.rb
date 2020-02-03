class Customer < ApplicationRecord
  has_many :invoices

  def self.merchant_transactions(merchant_id)
      Customer.joins(invoices: :transactions).
      select('customers.*, count(transactions.id) as transactions').
      group(:id).
      merge(Transaction.successful).
      merge(Invoice.merchant(merchant_id)).
      order('transactions desc').
      limit(1)
    end

  def self.customer_merchant_transactions(customer_id)
      Merchant.joins(invoices: :transactions).
      select('merchants.*, count(transactions.id) as transactions').
      group(:id).
      merge(Transaction.successful).
      merge(Invoice.customer(customer_id)).
      order('transactions desc').
      limit(1)
    end
end
