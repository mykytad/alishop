class Manager::ProductsController < ManagerController
  before_action :store
  include ExportProduct
  include ImportProduct

  def new
    @product = store.products.new
    @categories = Category.all
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
    @categories = Category.all
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

  def export
    export_product
  end

  def import
  end

  def post_import
    file = params[:file]
    file_data = file.read
    store_id = @store.id
    file_type = params[:file].content_type
    ImportProductJob.perform_later(file_type, file_data, store_id)
    redirect_to manager_store_path(@store.id), notice: "import in progress"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :discount, { images: [] }, :category_id)
  end

  def store
    @store ||= current_user.stores.find(params[:store_id])
  end
end
