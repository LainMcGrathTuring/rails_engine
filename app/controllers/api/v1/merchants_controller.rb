class Api::V1::MerchantsController < ApplicationController

  def show
    if params[:id] == "find"
      if request.query_parameters[:id]
        merchant = Merchant.find_by(id: request.query_parameters[:id])
      elsif request.query_parameters[:name]
        merchant = Merchant.find_by(name: request.query_parameters[:name])
      elsif request.query_parameters[:created_at]
        merchant = Merchant.find_by(created_at: request.query_parameters[:created_at])
      elsif request.query_parameters[:updated_at]
        merchant = Merchant.find_by(updated_at: request.query_parameters[:updated_at])
      end
    else
      merchant = Merchant.find(params[:id])
    end
    render json: MerchantSerializer.new(merchant)
  end

  def index
    require "pry"; binding.pry
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants)
  end
end
