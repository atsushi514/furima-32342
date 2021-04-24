class OrdersController < ApplicationController
  before_action :authenticate_user! ,only: [:index,:create,]
  before_action :set_product, only: [:index, :create,]
  before_action :user_product, only:[:index,:create]
  before_action :sold_out_item, only: [:index,:show]

  def index
    @order_address = OrderAddress.new
    if current_user == @product.user
      redirect_to root_path
  end
end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
       @order_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :address, :building_name, :phone_number).merge(token: params[:token],product_id: params[:product_id],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price, 
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
end
def user_product
  redirect_to root_path unless @product.user_id == @product.user_id
end

def sold_out_item
  redirect_to root_path if @product.order.present?
 end
end

