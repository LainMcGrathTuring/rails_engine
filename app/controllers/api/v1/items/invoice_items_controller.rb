class Api::V1::Items::InvoiceItemsController < ApplicationController

  def index
    item = Item.find_by(id: params['item_id'])
    invoice_item = InvoiceItem.where(item_id: item.id)
    render json: InvoiceItemSerializer.new(invoice_item)
  end
end
