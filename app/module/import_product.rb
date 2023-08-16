module ImportProduct
  def import_product
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
end
