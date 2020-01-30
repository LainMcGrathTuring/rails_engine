class Api::V1::InvoicesController < ApplicationController

  def index
    if params[:merchant_id]
      merchant = Merchant.find(params[:merchant_id])
      render json: InvoiceSerializer.new(merchant.invoices.all)
    else
      render json: InvoiceSerializer.new(Invoice.all)
    end
  end

  def show
    if params[:id] == "find"
      invoice = Invoice.find_by(request.query_parameters)
    elsif params[:id] == "find_all"
      invoice = Invoice.where(request.query_parameters).order(:id)
    else
      invoice = Invoice.find(params[:id])
    end
    render json: InvoiceSerializer.new(invoice)
  end
end
