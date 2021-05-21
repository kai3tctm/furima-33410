class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def edit
  end

  def update
    if @items.update(item_params)
      redirect_to item_path(@items.id)
    else
     render :edit
    end
  end

  def destroy
    @items.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :product_info, :category_id, :product_status_id, :delivery_burden_id, :delivery_area_id, :estimated_delivery_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @items.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @items = Item.find(params[:id])
  end
end
