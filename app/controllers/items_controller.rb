class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :product_info, :category_id, :product_status_id, :delivery_burden_id, :delivery_area_id, :estimated_delivery_id, :image).merge(user_id: current_user.id)
  end
end
