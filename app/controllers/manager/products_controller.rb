class Manager::ProductsController < ApplicationController
  def new
    @product = store.products.new
  end

  def create
    @product = store.products.create(product_params)

    if @product.save
      redirect_to manager_store_path(@store)
    else
      return render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @product = store.products.find(params[:id])
  end

  def update
    @product = store.products.find(params[:id])

    if @product.update(product_params)
      redirect_to manager_store_path(@store)
    else
      render :edit
    end
  end

  def destroy
    @product = store.products.find(params[:id])
    @product.destroy
    redirect_to manager_store_path(@store)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :discount, :image {images:[]})  #:image,
  end

  def store
    @store ||= current_user.stores.find(params[:store_id])
  end
end
