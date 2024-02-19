class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]
  before_action :move_to_new_user_session_path, only: [:edit]
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
      render new_item_path, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_new_user_session_path
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def move_to_root_path
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_cost_payer_id,
                                 :origin_region_id, :days_until_shipping_id, :sale_price).merge(user_id: current_user.id)
  end
end
