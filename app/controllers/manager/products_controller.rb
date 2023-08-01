class Manager::ProductsController < ManagerController
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
    @store = Store.find(params[:store_id])
    respond_to do |format|
      format.html
      format.csv do
        products = @store.products
        products_csv = products.map do |product|
          ["\"#{product.name}\"", product.price, product.discount, "\"#{product.description}\""].join(",")
        end

        products_csv = products_csv.join("\n")
        send_data(products_csv, :filename => "#{@store.name}_products.csv")
        # render :plain => products_csv
      end
      format.json do
        products = @store.products
        products_json = products.map do |product|
          product.to_json(:only => [:name, :price, :discount, :description])
        end

        # products_json = products_json.join("\n")
        send_data(products_json, :filename => "#{@store.name}_products.json")
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :discount, { images: [] }, :category_id)
  end

  def store
    @store ||= current_user.stores.find(params[:store_id])
  end
end
