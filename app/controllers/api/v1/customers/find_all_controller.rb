class Api::V1::Customers::FindAllController < ApplicationController

  def index
    customers = Customer.where(request.query_parameters)
    render json: CustomerSerializer.new(customers)
  end
end
