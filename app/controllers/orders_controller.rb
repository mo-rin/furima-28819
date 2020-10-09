class OrdersController < ApplicationController
  before_action :select_item, only: [:index, :create, :pay_item]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  def order_params
    params.require(:order_address).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_num).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end
 
  def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def select_item
    @item = Item.find(params[:item_id])
  end
end
