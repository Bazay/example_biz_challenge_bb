module Formatter
  module Currency
    def self.format(value, currency)
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

    end
  end

  module Date
    def self.format(date)
      # Currency codes can include: GBP, USD, EUR
      # Input values include:
      #  - 1,000.00 (US)
      #  - 1.000,00 (Europe)
      #  - 1000
      #  - 1000.00
      #
      # Output values should be returned in GBP:
      #  - 1,000.00



    end
  end
end