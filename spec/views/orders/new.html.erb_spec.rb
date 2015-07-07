require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :customer_id => 1,
      :supplier_id => 1,
      :delivery_address => "MyText",
      :total_order_value => 1.5,
      :currency => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_customer_id[name=?]", "order[customer_id]"

      assert_select "input#order_supplier_id[name=?]", "order[supplier_id]"

      assert_select "textarea#order_delivery_address[name=?]", "order[delivery_address]"

      assert_select "input#order_total_order_value[name=?]", "order[total_order_value]"

      assert_select "input#order_currency[name=?]", "order[currency]"
    end
  end
end
