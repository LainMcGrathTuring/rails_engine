class Api::V1::Customers::FindController < ApplicationController

  def index
    customer = Customer.find_by(request.query_parameters)
    render json: CustomerSerializer.new(customer)
  end
end
