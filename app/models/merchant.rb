class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices


  def self.most_revenue(number_of_records)
    Merchant.joins(invoices: [:invoice_items, :transactions]).
    select('merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue').
    group(:id).
    merge(Transaction.successful).
    order('total_revenue desc').
    limit(number_of_records)
  end

  def self.total_items_sold(number_of_records)
    Merchant.joins(invoices: [:invoice_items, :transactions]).
    select('merchants.*, sum(invoice_items.quantity) AS total_sold').
    group(:id).
    merge(Transaction.successful).
    order('total_sold desc').
    limit(number_of_records)
  end

  def self.total_revenue(merchant_id)
    merchant =  Merchant.joins(invoices: [:invoice_items, :transactions]).
      select('merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue').
      group(:id).
      merge(Transaction.successful).
      where(id: merchant_id)
    merchant.first
  end
end
