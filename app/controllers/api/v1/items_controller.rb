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
      render json: ItemSerializer.new(merchant.items.all)
    else
      items = Item.all
      render json: ItemSerializer.new(items)
    end
  end
end
