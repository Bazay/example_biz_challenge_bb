require 'csv'

module Interpreter
  module Format
    #Contains Format::Csv, Format::Text

    module Csv
      CSV_SETTINGS = {headers: true, header_converters: :symbol}

      def self.read_file(filename)
        records = []
        CSV.foreach(filename, CSV_SETTINGS) do |row|
          records << row.to_hash
        end

        return records
      end

      def self.read_files(filenames_array)
        records = []
        filenames_array.each do |filename|
          CSV.foreach(filename, CSV_SETTINGS) do |row|
            records << row.to_hash
          end
        end

        return records
      end
    end

    module Txt
      SEPARATOR = ';'
      def self.read_file(filename)
        headers = []
        records = []

        f = File.open(filename, "r")
        headers = f.each_line.first.split(SEPARATOR).map{|h|h.parameterize.underscore.to_sym}
        
        f.each_line do |line|
          values = line.split(SEPARATOR)

          records << Hash[headers.collect.with_index{|h,i| [h, sanitize(values[i])] }]
        end
        f.close

        return records
      end

      protected
      def self.sanitize(string)
        return string.gsub(/\n/,'').gsub(/\"/,'').gsub(/\'/,'')
      end
    end
  end
end