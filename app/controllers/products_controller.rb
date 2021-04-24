class ProductsController < ApplicationController
   before_action :authenticate_user! ,only: [:new,:create,:edit,:update,:destroy]
   before_action :set_product, only: [:show, :edit, :update,:destroy]
   before_action :user_product, only:[:edit, :update,:destroy]
   before_action :soldout_edit, only:[:edit]
  def index
    @products = Product.order("created_at DESC")
  end

  def new
   @product = Product.new
   end

   def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end

  def update
   if @product.update(product_params)
    redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image,:name,:description,:price,:shopping_charge_id,:shopping_area_id,:shopping_date_id,:category_id,:status_id,).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def user_product
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def soldout_edit
    redirect_to root_path if @product.order.present?
 end
end
