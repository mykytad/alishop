class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    def new
        @product = Product.new        
    end
    def create
        @store = Store.find(params[:store_id])
        @product = @store.products.create(product_params)
        redirect_to store_path(@store)
    end

    private
    def product_params
        params.require(:product).permit(:name, :discription, :price, :discount)
    end
end