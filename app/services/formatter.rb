require 'Order'

module Formatter
  module Currency

    CURRENCY_EUR = "EUR"
    CURRENCY_GBP = "GBP"
    CURRENCY_USD = "USD"

    #Float defaults
    FLOAT_DD = '.'
    FLOAT_TD = ''
    
    #For USD/GBP
    REG_DD = '.'
    REG_TD = ','

    #For EUR
    EUR_DD = ','
    EUR_TD = '.'

    def self.to_float(value, currency)
      # Currency codes can include: GBP, USD, EUR
      # Input values include:
      #  - 1,000.00 (US)
      #  - 1.000,00 (Europe)
      #  - 1000
      #  - 1000.00
      #
      # Output values should be returned in GBP:
      #  - 1,000.00

      #Convert to FLOAT datatype
      case currency
      when CURRENCY_EUR
        value = value.gsub(EUR_TD,FLOAT_TD).gsub(EUR_DD, FLOAT_DD).to_f
      when CURRENCY_GBP
        value = value.gsub(REG_TD,FLOAT_TD).to_f
      when CURRENCY_USD
        value = value.gsub(REG_TD,FLOAT_TD).to_f
      end
        
      return value
    end

    def self.to_gbp_format(value)
      thousands = ','
      "#{
        ( "%.2f" % value ).gsub(
          /(\d)(?=(?:\d{3})+(?:$|\.))/,
          "\\1#{thousands}"
        )
      }"
    end

    class FX
      def initialize
        @fx = OpenExchangeRates::Rates.new
      end

      def to_eur(value,currency)
        @fx.convert(value, :from => currency, :to => CURRENCY_EUR)
      end
      def to_gbp(value,currency)
        @fx.convert(value, :from => currency, :to => CURRENCY_GBP)
      end
      def to_usd(value,currency)
        @fx.convert(value, :from => currency, :to => CURRENCY_USD)
      end
    end
  end

  module Dates

    COUNTRY_EU = Formatter::Currency::CURRENCY_EUR
    COUNTRY_UK = Formatter::Currency::CURRENCY_GBP
    COUNTRY_US = Formatter::Currency::CURRENCY_USD

    def self.to_date(date_string, country)
      # Input values:
      # Know date formats include:
      #  - mm/dd/yyyy
      #  - mm-dd-yyyy
      #  - mm-dd-yy
      #  - dd/mm/yyyy
      #  - dd-mm-yyyy
      #  - dd-mm-yy
      #  - strftime, e.g. 'Sat, 10 Nov 2007'
      #
      # Output values should be:
      #  - "mm-dd-yyyy"
      datetime = date_string
      string_is_strftime = !(date_string.include?('-') || date_string.include?('/'))
      
      if string_is_strftime
        Date.parse(date_string)
      else
        #convert to readable format
        date_string = date_string.gsub('-','/').split('/').map{|x|x.last(2)}.join('/')
          
        case country
        when COUNTRY_US
          datetime = Date.strptime(date_string, "%m/%d/%y")
        else
          datetime = Date.strptime(date_string, "%d/%m/%y")
        end
      end

      return datetime
    end

    def self.to_uk_format(date)
      date.strftime("%m/%d/%y")
    end
  end
end