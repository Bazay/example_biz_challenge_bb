require 'rails_helper'

RSpec.describe 'seeds.rb' do
  before :each do
    setup
  end

  it 'parses the orders as intended' do
    order_hashes = Parser::Format::Csv.read_files(@csv_files)
    order_hashes.push(*Parser::Format::Txt.read_file(@txt_file))

    expect(order_hashes.length).to eql(11)
  end

  it 'creates orders as intended' do
    order_hashes = Parser::Format::Csv.read_files(@csv_files)
    order_hashes.push(*Parser::Format::Txt.read_file(@txt_file))

    orders = []
    order_hashes.each do |hash|
      order = Order.new(Order.format_fields_for_order(hash))
      order.save
      orders << order
    end

    expect(Order.count).to eql(11)
  end

  def setup
    @csv_files = [
      'lib/assets/order_1.csv',
      'lib/assets/order_2.csv',
      'lib/assets/order_3.csv',
      'lib/assets/order_4.csv'
    ]

    @txt_file = 'lib/assets/order_5.txt'
  end
end
