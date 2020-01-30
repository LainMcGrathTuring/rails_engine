class Api::V1::CustomersController < ApplicationController

  def show
    if params[:id] == "find"
      customer = Customer.find_by(request.query_parameters)
    elsif params[:id] == "find_all"
      customer = Customer.where(request.query_parameters)
    elsif params[:invoice_id]
      invoice = Invoice.find_by(id: params[:invoice_id])
      customer = Customer.find_by(id: invoice.customer_id)
    else
      customer = Customer.find(params[:id])
    end
    render json: CustomerSerializer.new(customer)
  end

  def index
    customers = Customer.all
    render json: CustomerSerializer.new(customers)
  end
end
