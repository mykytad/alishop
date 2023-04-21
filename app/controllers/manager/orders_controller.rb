class Manager::OrdersController < ApplicationController
  def index
    store = Store.find(params[:store_id])
    @orders = store.orders
    @orders = @orders.order(:id => :DESC)
  end

  def show
  end

  def destroy
  end
end
