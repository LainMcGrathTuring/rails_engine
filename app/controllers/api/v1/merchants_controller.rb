class Api::V1::MerchantsController < ApplicationController

  def show
    if params[:id] == "find"
      merchant = Merchant.find_by(request.query_parameters)
    elsif params[:id] == "find_all"
      merchant = Merchant.where(request.query_parameters)
    elsif params[:item_id]
      item = Item.find_by(id: params[:item_id])
      merchant = Merchant.find_by(id: item.merchant_id)
    else
      merchant = Merchant.find(params[:id])
    end
    render json: MerchantSerializer.new(merchant)
  end

  def index
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants)
  end
end
