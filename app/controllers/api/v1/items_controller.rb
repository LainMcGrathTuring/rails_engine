class Api::V1::ItemsController < ApplicationController
  def show
    if params[:id] == "find"
      if request.query_parameters.keys == ["created_at"] || request.query_parameters.keys == ["updated_at"]
        item = Item.where(request.query_parameters).order(:id).first
      else
        item = Item.find_by(request.query_parameters)
      end
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
