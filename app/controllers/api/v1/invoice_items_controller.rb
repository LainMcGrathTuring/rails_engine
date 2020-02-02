class Api::V1::InvoiceItemsController < ApplicationController

  def show
    if params[:id] == "find"
      invoice_item = InvoiceItem.find_by(request.query_parameters)
    elsif params[:id] == "find_all"
      invoice_item = InvoiceItem.where(request.query_parameters).order(:id)
    else
      invoice_item = InvoiceItem.find(params[:id])
    end
    render json: InvoiceItemSerializer.new(invoice_item)
  end

  def index
    invoice_items = InvoiceItem.all
    render json: InvoiceItemSerializer.new(invoice_items)
  end
end
