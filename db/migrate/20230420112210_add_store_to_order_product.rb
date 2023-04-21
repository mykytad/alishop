class AddStoreToOrderProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :store_id, :integer
  end
end
