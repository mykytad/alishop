class Manager::OrdersController < ManagerController
  def index
    status = params[:status]
    if status.nil?
      status = "new"
    end

    @store = Store.find(params[:store_id])
    @orders = @store.orders
    @orders = @orders.order(:created_at => :DESC)

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

    @data_keys = Array.new(7) do |i|
      date = Time.now - i.day
      date.strftime("%d.%m.%g")
    end
    @data_keys = @data_keys.reverse

    @data_values = Array.new(7) do |i|
      date = Time.now.to_date - i.day
      orders = @orders.where("DATE(created_at) = DATE(?)", date)
      orders = orders.count
    end
    @data_values = @data_values.reverse
    # @data_keys = [
    #   Time.now.strftime("%d.%m.%g"),
    #   (Time.now - 1.day).strftime("%d.%m.%g"),
    #   (Time.now - 2.day).strftime("%d.%m.%g"),
    #   (Time.now - 3.day).strftime("%d.%m.%g"),
    #   (Time.now - 4.day).strftime("%d.%m.%g"),
    #   (Time.now - 5.day).strftime("%d.%m.%g"),
    #   (Time.now - 6.day).strftime("%d.%m.%g")
    # ]
    # @data_values = [1, 10, 7, 4, 20, 24, 15]
  end

  def destroy
  end
end
