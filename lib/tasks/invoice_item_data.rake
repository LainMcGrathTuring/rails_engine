def convert_price(unit_price)
  unit_price.to_f / 100
end

namespace :invoice_item_data do
  desc "TODO"
  task invoice_items: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "invoice_items.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      i = InvoiceItem.new
      i.item_id = row['item_id']
      i.invoice_id = row['invoice_id']
      i.quantity = row['quantity']
      i.unit_price = convert_price(row["unit_price"])
      i.created_at = row['created_at']
      i.updated_at = row['updated_at']

      i.save
    end
  end

end
