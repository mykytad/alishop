class Api::StoresController < ApiController
  def index
    @stores = Store.all
    render json: @stores
  end

  def show
    @store = Store.find(params[:id])
    @products = @store.products
    render json: @store
  end

  def products
    store = Store.find(params[:store_id])
    @products = store.products
    render json: @products
  end
end
