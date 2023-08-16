module ExportProduct
  def export_product
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
end
