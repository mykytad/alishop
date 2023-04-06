class OrderController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    total_price
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.sum_price = @sum
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :last_name, :email, :address, :zip, :country)
  end

  def total_price
    @cart = session[:cart]
    @products = Product.where({ :id => @cart })
    @sum = 0
    @products.each do |product|
      @sum += (product.price - product.discount) * @cart.count(product.id.to_s)
    end
  end
end
