class OrderController < ApplicationController
  def create
    @cart = session[:cart]
    @products = Product.where({ :id => @cart })
    @sum = 0
    @cart.each do |cart|
      @sum += @products.find(cart).price
    end
  end
end
