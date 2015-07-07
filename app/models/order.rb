class Order < ActiveRecord::Base
  #Constants
  CURRENCY_EUR = "EUR"
  CURRENCY_GBP = "GBP"
  CURRENCY_USD = "USD"
  VALID_CURRENCIES = [
    CURRENCY_EUR,
    CURRENCY_GBP,
    CURRENCY_USD
  ]

  DATE_REGEX = '/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/'

  #Validations
  validates :order_date, :format => { with: Order::DATE_REGEX, message: "must be readable format" }
  validates :customer_id, :numericality => {integer_only: true}, :presence => true, :allow_blank => false
  validates :supplier_id, :numericality => {integer_only: true}, :presence => true, :allow_blank => false
  validates :delivery_address, :presence => true # "" is a valid value, nil is not..
  validates :total_order_value, :numericality => {greater_than_or_equal_to: 0.00}
  validates :currency, :inclusion => { in: VALID_CURRENCIES }, :allow_blank => false
end
