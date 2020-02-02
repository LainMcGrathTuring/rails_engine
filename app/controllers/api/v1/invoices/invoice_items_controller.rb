class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    invoice = Invoice.find_by(id: params[:invoice_id])
    invoice_item = InvoiceItem.where(invoice_id: invoice.id)
    render json: InvoiceItemSerializer.new(invoice_item)
  end
end
