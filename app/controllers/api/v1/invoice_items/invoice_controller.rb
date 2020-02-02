class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def index
    invoice_item = InvoiceItem.find_by(id: params[:invoice_item_id])
    invoice = Invoice.find_by(id: invoice_item.invoice_id)
    render json: InvoiceSerializer.new(invoice)
  end
end
