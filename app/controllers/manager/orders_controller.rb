class Manager::OrdersController < ApplicationController
  before_action current_user.id == store.user_id

  def index
    @store = Store.find(params[:store_id])
    @orders = @store.orders
    @orders = @orders.order(:id => :DESC)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @products = @order.products
  end

  def destroy
  end
end
