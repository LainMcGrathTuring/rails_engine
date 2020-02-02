class Api::V1::Transactions::InvoiceController < ApplicationController

  def index
    transaction = Transaction.find_by(id: params[:transaction_id])
    invoice = Invoice.find_by(id: transaction.invoice_id)
    render json: InvoiceSerializer.new(invoice)
  end
end
