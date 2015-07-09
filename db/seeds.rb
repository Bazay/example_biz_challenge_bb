# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

#Import data files
@csv_files = [
  'lib/assets/order_1.csv',
  'lib/assets/order_2.csv',
  'lib/assets/order_3.csv',
  'lib/assets/order_4.csv'
]
@txt_file = 'lib/assets/order_5.txt'

#
order_hashes = Parser::Format::Csv.read_files(@csv_files)
order_hashes.push(*Parser::Format::Txt.read_file(@txt_file))

orders = []
order_hashes.each do |hash|
  order = Order.new(Order.format_fields_for_order(hash))
  order.save
  orders << order
end