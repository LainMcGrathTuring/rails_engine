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
    if params[:customer_id]
      customer = Customer.find(params[:customer_id])
      render json: TransactionSerializer.new(Transaction.where(invoice_id: customer.invoices.ids))
    else
      transactions = Transaction.all
      render json: TransactionSerializer.new(transactions)
    end
  end
end
