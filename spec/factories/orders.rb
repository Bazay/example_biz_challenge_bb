FactoryGirl.define do
  factory :order do
    order_date {(rand(5.0).years.ago).to_s}
    customer_id 1
    supplier_id 1
    delivery_address "123 Example St"
    total_order_value {rand(0.00..100.00)}
    currency "GBP"
  end

end
