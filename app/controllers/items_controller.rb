class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id)
  end
end
