class AddressController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
  end

  def new
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:buy_address).permit(:postal_code, :delivery_area_id, :municipality, :house_number, :building, :phone)
  end
end
