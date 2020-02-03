class Api::V1::TransactionsController < ApplicationController

  def show
    transaction = Transaction.find(params[:id])
    render json: TransactionSerializer.new(transaction)
  end

  def index
    transactions = Transaction.all
    render json: TransactionSerializer.new(transactions)
  end
end
