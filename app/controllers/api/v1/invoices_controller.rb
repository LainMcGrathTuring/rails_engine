class Api::V1::InvoicesController < ApplicationController

  def index
    if params[:merchant_id]
      merchant = Merchant.find(params[:merchant_id])
      invoices = merchant.invoices.all
    elsif params[:customer_id]
      customer = Customer.find(params[:customer_id])
      invoices = customer.invoices.all
    else
      invoices = Invoice.all
    end
    render json: InvoiceSerializer.new(invoices)
  end

  def show
    if params[:id] == "find"
      invoice = Invoice.find_by(request.query_parameters)
    elsif params[:transaction_id]
      transaction = Transaction.find_by(id: params[:transaction_id])
      invoice = Invoice.find_by(id: transaction.invoice_id)
    elsif params[:invoice_item_id]
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
