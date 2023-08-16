class ImportProductJob < ApplicationJob
  queue_as :default

  def perform(file_type, data, store_id)
    category_id = Category.first.id
    if file_type == 'text/csv'
      data = data.split("\n")
      data.each do |product_data|
        product_data = product_data.split(",")
        Product.create!(
          name: product_data[0],
          description: product_data[3],
          price: product_data[1],
          discount: product_data[2],
          category_id: category_id,
          store_id: store_id
        )
      end
    elsif file_type == "application/json"
      data = JSON.parse(data)
      data.each do |product_data|
        Product.create!(
          name: product_data["name"],
          description: product_data["description"],
          price: product_data["price"],
          discount: product_data["discount"],
          category_id: category_id,
          store_id: store_id
        )
      end
    end
  end
end
