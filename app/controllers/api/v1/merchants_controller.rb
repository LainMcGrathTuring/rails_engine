class Api::V1::MerchantsController < ApplicationController

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant)
  end

  def index
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants)
  end
end
