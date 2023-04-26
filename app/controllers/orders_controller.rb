class OrdersController < ApplicationController
  before_action :load_cart

  def index
    @orders = Order.where(:user_id => current_user.id)
    @orders = @orders.order(id: :DESC)
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
    @cart.stores.each do |store|
      order = Order.new(order_params)
      order.user_id = current_user.id
      order.store_id = store.id
      order.sum_price = 0
      if order.save
        @cart.products.where(:store_id => store.id).each do |product|
          @order_product = OrderProduct.new(:product_id => product.id, :order_id => order.id)
          @order_product.product_price = product.price - product.discount
          @order_product.product_count = @cart.count(product.id.to_s)
          @order_product.product_name = product.name
          @order_product.save
        end
      end
      sum_price = 0
      order.order_products.each do |product|
        sum_price += product.product_count * product.product_price
      end
      order.sum_price = sum_price
      order.save
    end
    @cart.clear_product

    redirect_to orders_path
    # @order = Order.new(order_params)
    # @order.user_id = current_user.id

    # if @order.save
    #   # @cart.products.each do |product|
    #   #   order_product = OrderProduct.new(:product_id => product.id, :order_id => @order.id)
    #   #   order_product.product_price = product.price - product.discount
    #   #   order_product.product_count = @cart.count(product.id.to_s)
    #   #   order_product.product_name = product.name
    #   #   order_product.save!
    #   end
    #   # @cart.clear_product

    #   # redirect_to @order
    # else
    #   @products = @cart.products
    #   @sum = @cart.sum
    #   render :new, status: :unprocessable_entity
    # end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to manager_store_order_path(@order.store_id, @order.id)
    else
      render :edit
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :last_name, :email, :address, :zip, :country)
  end
end
