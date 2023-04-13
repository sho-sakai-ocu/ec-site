class Public::OrdersController < ApplicationController
  before_action :cart_items_existring, except:[:completed]
  def new
    @customer = current_customer
    @order = Order.new
    @sum = params[:sum]
  end
  
  def confirm
    @customer = current_customer
    @sum = params[:order][:sum]
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    address_id = params[:order][:address_id]
    if address_id == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    elsif address_id == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end
  
  def completed
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.making_status = 0
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_completed_path
  end
  
  def index
  end
  
  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :address_id, :total_payment, :shipping_cost)
  end

  def cart_items_existring
    unless current_customer.cart_items.present?
      redirect_to cart_items_path
    end
  end
end
