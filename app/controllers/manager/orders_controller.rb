class Manager::OrdersController < ManagerController
  def index
    status = params[:status]
    if status.nil?
      status = "new"
    end

    @store = Store.find(params[:store_id])
    @orders = @store.orders
    @orders = @orders.order(:id => :DESC)

    @orders = @orders.where(status: status)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @products = @order.products
  end

  def destroy
  end
end
