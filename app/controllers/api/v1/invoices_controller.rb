class Api::V1::InvoicesController < ApplicationController

  def index
    invoices = Invoice.all
    render json: InvoiceSerializer.new(invoices)
  end

  def show
    # if params[:id] == "find"
    #   invoice = Invoice.find_by(request.query_parameters)
    # if params[:transaction_id]
    #   transaction = Transaction.find_by(id: params[:transaction_id])
    #   invoice = Invoice.find_by(id: transaction.invoice_id)
    if params[:invoice_item_id]
      invoice_item = InvoiceItem.find_by(id: params[:invoice_item_id])
      invoice = Invoice.find_by(id: invoice_item.invoice_id)
    elsif params[:id] == "find_all"
      invoice = Invoice.where(request.query_parameters).order(:id)
    else
      invoice = Invoice.find(params[:id])
    end
    render json: InvoiceSerializer.new(invoice)
  end
end
