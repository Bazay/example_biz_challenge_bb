class Order < ActiveRecord::Base

  #Constants
  CURRENCY_EUR = 'EUR'
  CURRENCY_GBP = 'GBP'
  CURRENCY_USD = 'USD'

  VALID_CURRENCIES = [
    CURRENCY_EUR,
    CURRENCY_GBP,
    CURRENCY_USD
  ]

  DATE_REGEX = /(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/

  #Validations
  validates :order_date, :presence => true#, :format => { with: Order::DATE_REGEX, message: "must be readable format" }
  validates :customer_id, :numericality => {integer_only: true}, :presence => true, :allow_blank => false
  validates :supplier_id, :numericality => {integer_only: true}, :presence => true, :allow_blank => false
  validates :delivery_address, :presence => true # "" is a valid value, nil is not..
  validates :total_order_value, :numericality => {greater_than_or_equal_to: 0.00}
  validates :currency, :inclusion => { in: VALID_CURRENCIES }, :allow_blank => false

  #Class methods
  def self.format_fields_for_order(hash)
    hash[:order_date] = format_date(hash[:order_date], hash[:currency])
    hash[:customer_id] = hash[:customer_id].to_i
    hash[:supplier_id] = hash[:supplier_id].to_i
    hash[:total_order_value] = format_float(hash[:total_order_value], hash[:currency])

    return hash
  end
  def self.format_date(date,country)
    Formatter::Dates::to_date(date,country)
  end
  def self.format_float(value,currency)
    Formatter::Currency::to_float(value,currency)
  end

  #Instance methods
  def formatted_total_order_value
    Formatter::Currency.to_gbp_format(total_order_value)
  end
  def formatted_order_date
    Formatter::Dates.to_uk_format(order_date)
  end

end
