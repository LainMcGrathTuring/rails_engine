class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def index
    merchant = Customer.customer_merchant_transactions(params[:customer_id].to_i).first
    render json: MerchantSerializer.new(merchant)
  end
end
