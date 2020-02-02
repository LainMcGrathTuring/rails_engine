class Api::V1::Merchants::FindAllController < ApplicationController

  def index
    merchant = Merchant.where(request.query_parameters)
    render json: MerchantSerializer.new(merchant)
  end
end
