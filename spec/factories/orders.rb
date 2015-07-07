FactoryGirl.define do
  factory :order do
    order_date "2015-07-07 15:15:07"
customer_id 1
supplier_id 1
delivery_address "MyText"
total_order_value 1.5
currency "MyString"
  end

end
