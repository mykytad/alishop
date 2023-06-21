class HomeController < ApplicationController
  def index
    @products = Product.all.last(10)
    @stores = Store.all.last(5)
    @discount_products = Product.all.where(" discount > 0").last(8)
    @categories = Category.all
  end
end
