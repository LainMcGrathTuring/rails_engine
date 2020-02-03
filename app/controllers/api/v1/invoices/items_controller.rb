class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    invoice_items = InvoiceItem.where(invoice_id: params['invoice_id'])
    item_ids = invoice_items.map(&:item_id)
    items = Item.where(id: item_ids)
    render json: ItemSerializer.new(items)
  end
end
