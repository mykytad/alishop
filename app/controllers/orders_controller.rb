class OrdersController < ApplicationController
  before_action :load_cart
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @orders = Order.where(:user_id => current_user.id)
    @orders = @orders.order(id: :DESC)

    if params[:order_search].present?
      @orders = @orders.where("(id) like ?", "%#{params[:order_search]}%")
    end
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
    @products = @cart.products
    @sum = @cart.sum
    @payments = []

    unless user_signed_in?
      existing_users = User.where(:email => params[:order][:email])
      if existing_users == []
        user = create_user
        sign_in(user)
      else
        redirect_to new_user_session_path
        return
      end
    end

    @cart.stores.each do |store|
      order = create_order(store, current_user || user)

      unless order.save
        @order = order
        return render(:new, status: :unprocessable_entity)
      end
    end

    payment_ids = @payments.map do |payment|
      payment.id
    end

    @cart.clear_product

    redirect_to checkout_payments_path(:ids => payment_ids)
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

  def vue_table
    @orders = Order.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.json { render :json => @orders.to_json }
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :last_name, :email, :address, :phone, :zip, :country, :status)
  end

  def create_order_product(product, order)
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

  def create_order(store, user)
    order = Order.new(order_params)
    order.user_id = user.id
    order.store_id = store.id
    order.sum_price = 0

    if order.save
      @cart.products.where(:store_id => store.id).each do |product|
        create_order_product(product, order)
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
        @payments << payment
      end
    end

    return order
  end

  def create_user
    user = User.create(
      name: params[:order][:name],
      email: params[:order][:email],
      phone: params[:order][:phone],
      password: "qwerty",
      password_confirmation: "qwerty"
    )
  end
end
