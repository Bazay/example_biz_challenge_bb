require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :customer_id => 1,
        :supplier_id => 2,
        :delivery_address => "MyText",
        :total_order_value => 1.5,
        :currency => "Currency"
      ),
      Order.create!(
        :customer_id => 1,
        :supplier_id => 2,
        :delivery_address => "MyText",
        :total_order_value => 1.5,
        :currency => "Currency"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
  end
end
