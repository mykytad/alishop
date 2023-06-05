class OrdersController < ApplicationController
  before_action :load_cart
  # before_action :authenticate_user!

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
    if :authenticate_user!
      payments = []
      @cart.stores.each do |store|
        order = Order.new(order_params)
        order.user_id = current_user.id
        order.store_id = store.id
        order.sum_price = 0

        if order.save
          @cart.products.where(:store_id => store.id).each do |product|
            order_product = OrderProduct.new(
              :product_id => product.id,
              :order_id => order.id
            )
            order_product.product_price = product.price - product.discount
            order_product.product_count = @cart.count(product.id.to_s)
            order_product.product_name = product.name
            order_product.product_image = product.images[0]
            order_product.save
          end
          sum_price = 0
          order.order_products.each do |product|
            sum_price += product.product_count * product.product_price
          end

          order.sum_price = sum_price
          if order.save
            payment = Payment.new(
              :order_id => order.id,
              :user_id => order.user_id
            )
            payment.save
            payments << payment
          end
        else
          @order = order
          @products = @cart.products
          @sum = @cart.sum
          return render(:new, status: :unprocessable_entity)
        end
      end

      payment_ids = payments.map do |payment|
        payment.id
      end
      @cart.clear_product

      redirect_to checkout_payments_path(:ids => payment_ids)
    else
      User.create(
      name: :name,
      email: :email,
      phone: :phone,
      password: "qwerty",
      password_confirmation: "qwerty"
    )
    end
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
    params.require(:order).permit(:name, :last_name, :email, :address, :zip, :country, :status)
  end
end
