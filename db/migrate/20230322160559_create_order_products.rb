class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.string :product_name
      t.integer :product_price, null: false
      t.integer :product_count, null: false
      t.integer :product_id
      t.integer :order_id
      t.timestamps
    end
  end
end
