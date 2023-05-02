class AddImageForOrderProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :product_image, :string
  end
end
