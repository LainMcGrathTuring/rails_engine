class Api::V1::Invoices::MerchantController < ApplicationController

  def index
    invoice = Invoice.find_by(id: params[:invoice_id])
    merchant = Merchant.find_by(id: invoice.merchant_id)
    render json: MerchantSerializer.new(merchant)
  end
end
