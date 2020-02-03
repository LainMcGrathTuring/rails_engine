class Api::V1::Items::MostItemsController < ApplicationController

  def index
    items = Item.total_number_sold(params['quantity'].to_i)
    render json: ItemSerializer.new(items)
  end
end
