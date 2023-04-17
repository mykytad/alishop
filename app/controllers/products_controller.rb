class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)

    if params[:search].present?
      @products = @products.where("lower(name) like ?", "%#{params[:search].downcase}%")
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = store.products.new
  end

  def create
    @product = store.products.create(product_params)
    redirect_to store_path(@store)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = store.products.find(params[:id])
    @product.destroy
    redirect_to store_path(@store)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :discount, :image)
  end

  def store
    @store ||= current_user.stores.find(params[:store_id])
  end
end
