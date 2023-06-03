class Manager::StoresController < ManagerController
  def index
    @stores = Store.where(:user_id => current_user.id)
  end

  def show
    @store = Store.find(params[:id])
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
  
  def manager
    store = Store.find(params[:id])
    if current_user.id != store.user_id
      redirect_to root_url
    end
  end
end
