class Api::V1::Transactions::FindController < ApplicationController

  def index
    transaction = Transaction.find_by(request.query_parameters)
    render json: TransactionSerializer.new(transaction)
  end
end
