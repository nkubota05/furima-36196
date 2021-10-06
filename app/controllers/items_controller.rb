class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  # def index
  # @item = Item.all
  # end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :price, :user, :status_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_day_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
