class SearchController < ApplicationController
  def elsearch
    @products = Product.all
    @products = Product.search(params[:query])
  end
end
