class Api::V1::Transactions::FindAllController < ApplicationController

  def index
    transactions = Transaction.where(request.query_parameters).order(:id)
    render json: TransactionSerializer.new(transactions)
  end
end
