class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :order_id
      t.string :payment_type
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
