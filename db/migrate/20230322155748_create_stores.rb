class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :phone, null: false
      t.timestamps
    end
  end
end
