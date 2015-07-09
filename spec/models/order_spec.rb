require 'rails_helper'

RSpec.describe Order, type: :model do
  context "Validates" do
    before :each do
      @order = build(:order)
    end

    # it "order_date format" do
    #   @order.order_date = "not a valid datetime"
    #   expect(@order.valid?).to eql(false)
    #   expect(@order.errors.include?(:order_date)).to eql(true)
    # end

    it "order_date presence" do
      @order.order_date = nil
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:order_date)).to eql(true)
    end
    it "customer_id is an integer" do
      @order.customer_id = "invalid"
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:customer_id)).to eql(true)
    end
    it "customer_id presence" do
      @order.customer_id = nil
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:customer_id)).to eql(true)
    end
    it "supplier_id is an integer" do
      @order.supplier_id = "invalid"
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:supplier_id)).to eql(true)
    end
    it "supplier_id presence" do
      @order.supplier_id = nil
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:supplier_id)).to eql(true)
    end
    it "delivery_address presence" do
      @order.delivery_address = nil
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:delivery_address)).to eql(true)
    end
    it "total_order_value is a float" do
      @order.total_order_value = "invalid"
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:total_order_value)).to eql(true)
    end
    it "total_order_value presence" do
      @order.total_order_value = nil
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:total_order_value)).to eql(true)
    end
    it "currency is included" do
      @order.currency = "invalid"
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:currency)).to eql(true)
    end 
    it "currency presence" do
      @order.currency = nil
      expect(@order.valid?).to eql(false)
      expect(@order.errors.include?(:currency)).to eql(true)
    end
  end
end
