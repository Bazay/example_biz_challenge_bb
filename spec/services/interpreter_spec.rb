require 'rails_helper'

RSpec.describe Interpreter, type: :service do
  context "Format" do
    before :each do
      file_setup
    end

    context "Csv" do
      it "reads from a .csv file" do
        #puts Interpreter::Format::Csv.read_file('lib/assets/order_1.csv')
        expect(Interpreter::Format::Csv.read_file(@csv_files.first).blank?).to eql(false)
      end

      it "reads from multiple .csv files" do
        expect(Interpreter::Format::Csv.read_files(@csv_files).blank?).to eql(false)
      end
    end

    context "Txt" do
      it "reads from a .txt file" do
        expect(Interpreter::Format::Txt.read_file(@txt_file).blank?).to eql(false)
      end
      it 'hash array is correctly formatted' do
        returned_keys = Interpreter::Format::Txt.read_file(@txt_file).first.keys
        @expected_keys.each do |key|
          expect(returned_keys).to include(key)
        end
      end
    end
  end

  #Methods
  def file_setup
    @csv_files = [
      'lib/assets/order_1.csv',
      'lib/assets/order_2.csv',
      'lib/assets/order_3.csv',
      'lib/assets/order_4.csv'
    ]
    @txt_file = 'lib/assets/order_5.txt'
    @expected_keys = [:order_date, :customer_id, :supplier_id, :delivery_address, :total_order_value, :currency]
  end
end
