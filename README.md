# Rails Engine

##Description
Rails Engine is an API designed to expose fictional data.

1. After cloning, run the following commands to setup the database and Rails Engine app:
```
$ bundle install
$ bundle update
$ rails db:{create,migrate}
```
2. Import data:
```
$ rails customer_data:customers
$ rails merchant_data:merchants
$ rails item_data:items
$ rails invoice_data:invoices
$ rails invoice_item_data:invoice_items
$ rails transaction_data:transactions
```

3.  To run test suite:
```
rspec
```

4. Endpoints

* Merchants
* Customers
* Items
* Invoices
* Invoice Items
* Transactions

4. Relationship Endpoints

### Customers
* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
* `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

### Merchants
* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders

### Items
* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant

### Invoices
* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant

### Invoice Items
* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item

### Transactions
* `GET /api/v1/transactions/:id/invoice` returns the associated invoice

5. Business Intelligence Endpoints

### All Merchants
* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top x merchants ranked by total revenue

### Single Merchant
* `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
### Items
* `GET /api/v1/items/most_revenue?quantity=x` returns the top x items ranked by total revenue generated

### Customers
* `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions

NOTE: Failed charges are never counted in revenue totals or statistics.

NOTE: All revenues are reported as a float with two decimal places.

## Schema Design
![image](https://github.com/LainMcGrath/rails_engine/blob/business_logic/db/schema.png)
