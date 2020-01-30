class Api::V1::TransactionsController < ApplicationController

  def show
    if params[:id] == "find"
      transaction = Transaction.find_by(request.query_parameters)
    elsif params[:id] == "find_all"
      transaction = Transaction.where(request.query_parameters).order(:invoice_id)
    else
      transaction = Transaction.find(params[:id])
    end
    render json: TransactionSerializer.new(transaction)
  end

  def index
    transactions = Transaction.all
    render json: TransactionSerializer.new(transactions)
  end
end
