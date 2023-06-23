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

  def statistic
    @store = Store.find(params[:store_id])
    @orders = @store.orders
    @orders = @orders.order(:id => :DESC)
    @data_keys = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June'
    ]
    @data_values = [0, 10, 5, 2, 20, 30]
  end

  def destroy
  end
end
