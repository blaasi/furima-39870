class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless current_user == @item.user

    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    return if current_user == @item.user && !@item.sold_out?

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_cost_payer_id,
                                 :origin_region_id, :days_until_shipping_id, :sale_price).merge(user_id: current_user.id)
  end
end
