class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def update
    CartItem.find(params[:cart_item][:cart_item_id]).update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @item.present?
      new_amount = @item.amount + @cart_item.amount
      @item.update_attribute(:amount, new_amount)
    else
      @cart_item.item_id = Item.find(params[:cart_item][:item_id]).id
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
