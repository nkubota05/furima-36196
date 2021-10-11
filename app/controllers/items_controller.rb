class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:new, :destroy]

  def index
   @items = Item.all.order("created_at DESC")
  end

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

  def show
  end

  def destroy
    if current_user.id == @Item.user_id 
      @item.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:image, :name, :description, :price, :user, :status_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_day_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
