require 'ruby_zoho'

RubyZoho.configure do |config|
  config.api_key = '' #put your api key between the quotes
  # config.crm_modules = ['Accounts', 'Contacts', 'Leads', 'Potentials'] # Defaults to free edition if not set
  # config.crm_modules = ['Quotes', 'SalesOrders', 'Invoices'] # Depending on what kind of account you've got, adds to free edition modules
  # config.ignore_fields_with_bad_names = true # Ignores field with special characters in the name (Release 1.8)
  # Currently only Quotes are supported
end