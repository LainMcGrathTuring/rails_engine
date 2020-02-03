class Api::V1::Invoices::FindAllController < ApplicationController

  def index
    invoice = Invoice.where(request.query_parameters).order(:id)
    render json: InvoiceSerializer.new(invoice)
  end
end
