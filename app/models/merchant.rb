class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(number_of_records)
    #merchant to invoices
    #invoices to invoice_items, invoices to transactions
    Merchant.joins(invoices: [:invoice_items, :transactions]).
    select('merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue').
    group(:id).
    merge(Transaction.successful).
    order('total_revenue desc').
    limit(number_of_records)
  end
end
