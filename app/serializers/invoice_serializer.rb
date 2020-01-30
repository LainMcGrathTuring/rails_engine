class InvoiceSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :merchant
  belongs_to :customer

  attributes :id, :customer_id, :merchant_id, :status
end
