class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def index
    customer = Customer.merchant_transactions(params['merchant_id'].to_i).first
    render json: CustomerSerializer.new(customer)
  end
end
