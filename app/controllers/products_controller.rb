class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = store.products.new
  end

  def create
    @product = store.products.create(product_params)
    redirect_to store_path(@store)
  end

  def destroy
    @product = store.products.find(params[:id])
    @product.destroy
    redirect_to store_path(@store)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :discount)
  end

  def store
    @store ||= Store.find(params[:store_id])
  end
end
