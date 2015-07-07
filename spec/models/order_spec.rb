require 'rails_helper'

RSpec.describe Order, type: :model do
  context "Validates" do
    before :each do
      @order = build(:order)
    end

    it "order_date format" do
      @order.order_date = "not a valid datetime"
      expect(order.valid?).to eql(false)
      expect(order.errors.added?(:order_date)).to eql(true)
    end

    it "order_date presence" do
    end
    it "customer_id is an integer"
    it "customer_id presence"
    it "supplier_id is an integer"
    it "supplier_id presence"
    it "delivery_address presence"
    it "total_order_value is a float"
    it "total_order_value presence"
    it "currency format"
    it "currency presence"
  end
end
