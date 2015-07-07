require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :customer_id => 1,
      :supplier_id => 1,
      :delivery_address => "MyText",
      :total_order_value => 1.5,
      :currency => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_customer_id[name=?]", "order[customer_id]"

      assert_select "input#order_supplier_id[name=?]", "order[supplier_id]"

      assert_select "textarea#order_delivery_address[name=?]", "order[delivery_address]"

      assert_select "input#order_total_order_value[name=?]", "order[total_order_value]"

      assert_select "input#order_currency[name=?]", "order[currency]"
    end
  end
end
