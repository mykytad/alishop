class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.integer :discount, null: false
      t.integer :store_id, null: false
      t.timestamps
    end
  end
end
