class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :discription
      t.integer :price
      t.integer :discount
      t.integer :user_id
      t.integer :store_id
      t.timestamps
    end
  end
end
