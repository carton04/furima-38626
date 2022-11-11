class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_action
  before_action :contributor_confirmation

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end

  def set_action
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id
  end
end
