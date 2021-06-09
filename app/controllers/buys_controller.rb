class BuysController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    @items = Item.find(params[:item_id])
    if @buy_address.valid?
      @buy_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.permit(:postal_code, :delivery_area_id, :municipality, :house_number, :building, :phone)
  end
end

{  } 