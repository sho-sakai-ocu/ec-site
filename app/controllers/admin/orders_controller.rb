class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @sum = 0
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "payment_confirmation"
      @order.order_details.update_all(making_status: 1)
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.required(:order).permit(:status)
  end

end
