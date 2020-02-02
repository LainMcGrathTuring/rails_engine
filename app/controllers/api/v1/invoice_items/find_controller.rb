class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    invoice_item = InvoiceItem.find_by(request.query_parameters)
    render json: InvoiceItemSerializer.new(invoice_item)
  end
end
