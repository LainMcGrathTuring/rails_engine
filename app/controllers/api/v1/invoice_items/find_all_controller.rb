class Api::V1::InvoiceItems::FindAllController < ApplicationController

  def index
    invoice_items = InvoiceItem.where(request.query_parameters).order(:id)
    render json: InvoiceItemSerializer.new(invoice_items)
  end
end
