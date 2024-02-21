class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_new_user_session_path, only: [:index]
  before_action :move_to_root_path, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :origin_region_id, :city, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sale_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_new_user_session_path
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_root_path
    if current_user == @item.user || @item.sold_out?
      redirect_to root_path
    end
  end
end
