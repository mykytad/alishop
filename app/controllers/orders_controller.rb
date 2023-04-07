class OrdersController < ApplicationController
  before_action :load_cart

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
      @cart.clear_product
      redirect_to @order
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :last_name, :email, :address, :zip, :country, :sum_price)
  end
end
