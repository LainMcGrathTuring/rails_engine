namespace :invoice_data do
  desc "TODO"
  task invoices: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "invoices.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      i = Invoice.new
      i.customer_id = row["customer_id"]
      i.merchant_id = row["merchant_id"]
      i.status = row["status"]
      i.created_at = row["created_at"]
      i.updated_at = row["updated_at"]

      i.save
    end
  end

end
