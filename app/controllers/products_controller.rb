class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)

    if params[:search].present?
      @products = @products.where("lower(name) like ?", "%#{params[:search].downcase}%")
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = @product.reviews
  end
end
