class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :item
  belongs_to :invoice

  attributes :id, :invoice_id, :item_id, :quantity, :unit_price
end
