class OrdersController < ApplicationController
  before_action :load_cart

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @products = @order.products
  end

  def new
    @order = Order.new
    @products = @cart.products
    @sum = @cart.sum
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      @cart.products.each do |product|
        order_product = OrderProduct.new(:product_id => product.id, :order_id => @order.id)
        # order_product.product_price = product.price
        order_product.save!
      end
      @cart.clear_product

      redirect_to @order
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :last_name, :email, :address, :zip, :country, :sum_price, :products)
  end
end
