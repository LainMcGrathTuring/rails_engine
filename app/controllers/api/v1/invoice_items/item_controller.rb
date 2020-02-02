class Api::V1::InvoiceItems::ItemController < ApplicationController

  def index
    invoice_item = InvoiceItem.find_by(id: params[:invoice_item_id])
    item = Item.find_by(id: invoice_item.item_id)
    render json: ItemSerializer.new(item)
  end
end
