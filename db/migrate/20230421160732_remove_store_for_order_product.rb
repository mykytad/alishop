class RemoveStoreForOrderProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_products, :store_id
  end
end
