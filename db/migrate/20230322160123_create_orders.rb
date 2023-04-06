class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :zip, null: false
      t.string :country, null: false
      t.string :status, null: false, default: "new"
      t.integer :sum_price, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
