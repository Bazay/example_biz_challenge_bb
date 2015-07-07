json.array!(@orders) do |order|
  json.extract! order, :id, :order_date, :customer_id, :supplier_id, :delivery_address, :total_order_value, :currency
  json.url order_url(order, format: :json)
end
