class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
  end

  def destroy
    CartItem.find_by(id: params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
    # byebug
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    # @cart_item.item_id = CartItem.find(session[:cart_id]).id
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end
end
