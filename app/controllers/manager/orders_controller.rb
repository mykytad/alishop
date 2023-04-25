class Manager::OrdersController < ApplicationController
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

  def destroy
  end
end
