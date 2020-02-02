class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :item
  belongs_to :invoice

  attributes :id, :invoice_id, :item_id, :quantity

  attributes :unit_price do | unit |
    unit.unit_price.to_s
  end
end
