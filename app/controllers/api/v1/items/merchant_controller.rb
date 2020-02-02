class Api::V1::Items::MerchantController < ApplicationController

  def index
    item = Item.find_by(id: params['item_id'])
    merchant = Merchant.find_by(id: item.merchant_id)
    render json: MerchantSerializer.new(merchant)
  end
end
