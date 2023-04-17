class Admin::ItemsController < ApplicationController
  def index
    @word = params[:word]
    if @word.present?
      @items = Item.where("name LIKE?","%#{@word}%")
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      redirect_to new_admin_item_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end

end
