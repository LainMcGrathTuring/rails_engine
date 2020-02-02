class Api::V1::CustomersController < ApplicationController

  def show
    customer = Customer.find(params[:id])
    render json: CustomerSerializer.new(customer)
  end

  def index
    customers = Customer.all
    render json: CustomerSerializer.new(customers)
  end
end
