# Fastbill

Ruby API wrapper for the fastbill.com API

__NOTE__: This is work in progress and not yet available as a gem.

## Installation

Add this line to your application's Gemfile:

    gem 'fastbill', :git => "git://github.com/philklei/fastbill.git"

And then execute:

    bundle

Or install it yourself as:

    gem install fastbill

## Usage

### Configuration

    Fastbill::Configuration.configure do |config|
      config.email = "your@email.com"
      config.api_key = "yourverysecretapikey"
    end

### Customer

#### Get all customer
    Fastbill::Customer.all

#### Find by country code
    Fastbill::Customer.find_by_country("de")

#### Find by id
    Fastbill::Customer.find_by_id(12)

#### Search by ORGANIZATION, FIRST_NAME, LAST_NAME, ADDRESS, ADDRESS_2, ZIPCODE, EMAIL
    Fastbill::Customer.search("foo")

#### Create a new customer
There are different required fields depending on e.g. customer_type. Please have a look at the fastbill api documentation.

    Fastbill::Customer.create(last_name: "foo", first_name: "bar")

### Invoices
There are different required fields depending on e.g. invoice_type. Please have a look at the fastbill api documentation.

	invoice = Fastbill::Invoice.new
	invoice.customer_id     = 1
	invoice.invoice_date    = Date.today
	invoice.eu_delivery     = 0
	invoice.template_id     = "yourtemplateid"

	item                = Fastbill::InvoiceItem.new 
	item.description    = "You Item Desc"
	item.quantity       = 1
	item.unit_price     = 100.0
	item.vat_percent    = 19

	invoice.items = []
	invoice.items << item

	invoice.save
	
	
### Expense
There are different required fields depending on e.g. invoice_type. Please have a look at the fastbill api documentation.

#### Create a new expense

	expense = Fastbill::Expense.new
	expense.invoice_date 	= Date.today
	expense.organization 	= "Some Company"
	expense.sub_total		= 100.0
	expense.var_total		= 19.0
	
	expense.save
	
#### Get expenses by month
Get all expenses in july	
	
	
	Fastbill::Expense.find_by_month("7")

	
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
