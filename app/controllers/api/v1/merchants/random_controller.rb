class Api::V1::Merchants::RandomController < ApplicationController

  def index
    offset = rand(Merchant.count)
    merchant = Merchant.offset(offset).first
    render json: MerchantSerializer.new(merchant)
  end
end
