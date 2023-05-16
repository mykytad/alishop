class Manager::StoresController < ManagerController
  def index
    @stores = Store.where(:user_id => current_user.id)
  end

  def show
    @store = Store.find(params[:id])
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    redirect_to manager_stores_path
  end

  private

  def manager
    store = Store.find(params[:id])
    if current_user.id != store.user_id
      redirect_to root_url
    end
  end
end
