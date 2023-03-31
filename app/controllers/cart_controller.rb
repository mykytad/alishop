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
    @cart = session[:cart].delete(:product_id)
  end
end

#minus
# > x = [1,2,3,2]
# => [1, 2, 3, 2] 
# > x.delete_at(x.index 2)
# => 2 
# > x
# => [1, 3, 2] 
