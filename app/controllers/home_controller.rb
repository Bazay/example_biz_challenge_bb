class HomeController < ApplicationController
  def index
    @formatter = Formatter::Currency
    @fx = @formatter::FX.new
    @orders = Order.all
  end
end
