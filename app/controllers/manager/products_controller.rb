class Manager::ProductsController < ManagerController
  before_action :store

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
    respond_to do |format|
      format.html
      format.csv do
        products = store.products
        products_csv = products.map do |product|
          ["\"#{product.name}\"", product.price, product.discount, "\"#{product.description}\""].join(",")
        end

        products_csv = products_csv.join("\n")
        send_data(products_csv, :filename => "#{store.name}_products.csv")
        # render :plain => products_csv
      end
      format.json do
        products = store.products
        products_json = products.map do |product|
          { name: product.name, price: product.price, discount: product.discount, description: product.description }
        end
        products_json = JSON.generate(products_json)
        # __1__
        # products_json = products.to_json(:only => [:name, :price, :discount, :description])

        # __2__
        # products_json = products.map do |product|
        #   product.to_json(:only => [:name, :price, :discount, :description])
        # end

        # products_json = products_json.join(",")
        # products_json = "[#{products_json}]"
        send_data(products_json, :filename => "#{@store.name}_products.json")
      end
    end
  end

  def import
  end

  def post_import
    file = params[:file]
    file_data = file.read
    if params[:file].content_type == 'text/csv'
      file_data = file_data.split("\n")
      file_data.each do |product_data|
        product_data = product_data.split(",")
        Product.create!(
          name: product_data[0],
          description: product_data[3],
          price: product_data[1],
          discount: product_data[2],
          category_id: Category.first.id,
          store_id: @store.id
        )
      end
    elsif params[:file].content_type == "application/json"
      file_data = JSON.parse(file_data)
      file_data.each do |product_data|
        Product.create!(
          name: product_data["name"],
          description: product_data["description"],
          price: product_data["price"],
          discount: product_data["discount"],
          category_id: Category.first.id,
          store_id: @store.id
        )
      end
    else
      redirect_to manager_store_path(@store.id), alert: "import error"
    end

    redirect_to manager_store_path(@store.id), notice: "import success"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :discount, { images: [] }, :category_id)
  end

  def store
    @store ||= current_user.stores.find(params[:store_id])
  end
end
