class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.query_find(query_parameters)
    if query_parameters.keys == ["created_at"] || query_parameters.keys == ["updated_at"]
      item = Item.where(query_parameters).order(:id).first
    else
      item = Item.find_by(query_parameters)
    end
  end

  def self.total_number_sold(quantity)
    Item.joins(invoices: [:invoice_items, :transactions]).
    select('items.*, sum(invoice_items.quantity) AS total_sold').
    group(:id).
    merge(Transaction.successful).
    order('total_sold desc').
    limit(quantity)
  end
end
