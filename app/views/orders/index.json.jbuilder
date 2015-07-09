json.array!(@orders) do |order|
  json.order do
    json.id order.id
    json.customer do
      json.id order.customer_id
    end
    json.supplier do 
      json.id order.supplier_id
    end
    json.date order.formatted_order_date
    json.total_order_value do
      json.local_currency_code order.currency
      json.local_value order.formatted_total_order_value
      json.value @formatter.to_gbp_format(@fx.to_gbp(order.total_order_value, order.currency))
    end
  end
end
