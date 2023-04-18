class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @genre_id = params[:id]
    if @genre_id.present?
      @items = Item.where(genre_id: @genre_id)
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
