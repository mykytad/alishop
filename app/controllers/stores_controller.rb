class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id

    if @store.save
      redirect_to manager_store_orders_path(@store.id)
    else
      render :new
    end
  end

  def edit
    @store = current_user_store
  end

  def update
    @store = current_user_store

    if @store.update(store_params)
      redirect_to @store
    else
      render :edit
    end
  end

  def destroy
    @store = current_user_store
    @store.destroy

    redirect_to current_user
  end

  private

  def store_params
    params.require(:store).permit(:name, :description, :phone)
  end

  def current_user_store
    current_user.stores.find(params[:id])
  end
end
