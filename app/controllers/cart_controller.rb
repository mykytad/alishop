class CartController < ApplicationController
  def add
    session[:cart] = session[:cart].to_a
    session[:cart] << params[:product_id]
    redirect_to cart_show_path
  end

  def show
    @cart = session[:cart]
    @products = Product.where({ :id => @cart })
  end

  def delete
    @products = Product.where({ :id => @cart })
    @products.destroy
  end
end
