class CartController < ApplicationController
  before_action :cart

  def add
    session[:cart] << params[:product_id]
    redirect_to cart_show_path
  end

  def show
    @cart = session[:cart]
    @products = Product.where({ :id => @cart })
    @sum = 0
    @products.each do |product|
      @sum += product.price * @cart.count(product.id.to_s)
    end
    # @cart.each do |cart|
    #   @sum += @products.find(cart).price
    # end
  end

  def delete
    product_id = params[:product_id].to_s
    position = session[:cart].index(product_id)
    session[:cart].delete_at(position)
    redirect_to cart_show_path
  end

  def delete_all
    product_id = params[:product_id].to_s
    session[:cart].delete(product_id)
    redirect_to cart_show_path
  end

  def cart
    session[:cart] = session[:cart].to_a
  end
end
