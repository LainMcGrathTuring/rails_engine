class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    merchants = Merchant.total_items_sold(params['quantity'].to_i)
    render json: MerchantSerializer.new(merchants)
  end
end
