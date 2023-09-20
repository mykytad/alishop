class SearchController < ApplicationController
  def elsearch
    @products = Product.all
    # where("lower(name) like ?", "%#{params[:query].downcase}%")
    elastic_query = @products.where("lower(name) like ?", "%#{params[:query].downcase}%")
    @products = Product.search(params[:query])
  end
end
