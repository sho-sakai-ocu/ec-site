class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @sum = 0
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
  end
end
