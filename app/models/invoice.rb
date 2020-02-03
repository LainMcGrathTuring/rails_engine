class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer

  has_many :invoice_items
  has_many :transactions

  scope :merchant, -> (id) { where("merchant_id = ?", id) }
  
end
