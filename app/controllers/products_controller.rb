class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)

    if params[:search].present?
      @products = @products.where("lower(name) like ?", "%#{params[:search].downcase}%")
    end

    if params[:category_id].present?
      @products = @products.where("lower(category_id) like ?", "%#{params[:category_id].downcase}%" )
    end
  end

  def show
    @product = Product.find(params[:id])
    @store = @product.store
    @review = Review.new
  end
end
