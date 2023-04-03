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
end
