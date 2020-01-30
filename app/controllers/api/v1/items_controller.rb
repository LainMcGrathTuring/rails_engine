class Api::V1::ItemsController < ApplicationController
  def show
    if params[:id] == "find"
      item = Item.query_find(request.query_parameters)
    elsif params[:id] == "find_all"
      item = Item.where(request.query_parameters).order(:id)
    else
      item = Item.find(params[:id])
    end
    render json: ItemSerializer.new(item)
  end

  def index
    if params[:merchant_id]
      merchant = Merchant.find(params[:merchant_id])
      items = merchant.items.all
    elsif params[:invoice_id]
      invoice = Invoice.find_by(id: params[:invoice_id])
      invoice_items = InvoiceItem.where(invoice_id: invoice.id)
      ids = invoice_items.map { |invoice_item| invoice_item.item_id }
      items = Item.where(id: ids)
    else
      items = Item.all
    end
    render json: ItemSerializer.new(items)
  end
end
