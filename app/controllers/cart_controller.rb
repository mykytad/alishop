class CartController < ApplicationController
  before_action :load_cart

  def add
    @cart.add_product(product_id)

    redirect_to cart_show_path
  end

  def show
    @products = @cart.products
    @sum = @cart.sum
  end

  def delete
    @cart.delete_product(product_id)

    redirect_to cart_show_path
  end

  def delete_all
    @cart.delete_all_product(product_id)

    redirect_to cart_show_path
  end

  def product_id
    params[:product_id].to_s
  end
end
