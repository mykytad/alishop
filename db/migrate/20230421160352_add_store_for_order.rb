class AddStoreForOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :store_id, :integer
  end
end
