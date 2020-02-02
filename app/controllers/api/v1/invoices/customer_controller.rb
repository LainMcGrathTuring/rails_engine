class Api::V1::Invoices::CustomerController < ApplicationController

  def index
    invoice = Invoice.find_by(id: params[:invoice_id])
    customer = Customer.find_by(id: invoice.customer_id)
    render json: CustomerSerializer.new(customer)
  end
end
