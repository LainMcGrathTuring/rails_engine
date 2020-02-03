class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    customer = Customer.find_by(id: params['customer_id'])
    transactions = Transaction.where(invoice_id: customer.invoices.ids)
    render json: TransactionSerializer.new(transactions)
  end
end
