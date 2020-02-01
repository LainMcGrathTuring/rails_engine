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
    if params[:item_id]
      item = Item.find(params[:item_id])
      invoice_items = InvoiceItem.where(item_id: item.id)
    elsif params[:invoice_id]
      invoice_items = InvoiceItem.where(invoice_id: params[:invoice_id])
    else
      invoice_items = InvoiceItem.all
    end
    render json: InvoiceItemSerializer.new(invoice_items)
  end
end
