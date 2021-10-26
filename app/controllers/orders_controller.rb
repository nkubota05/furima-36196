class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!, only: [:index]

  def index
    if @item.user_id == current_user.id || !@item.order.nil?
      redirect_to root_path
    else
      @order = PayForm.new
    end
  end

  def create
    @order = PayForm.new(order_params)
    if @order.valid?
      pay_item

      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:pay_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
