class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    merchant = Merchant.total_revenue(params['merchant_id'].to_i)
    render json: MerchantRevenueSerializer.new(merchant)
  end
end
