class AddPaymentForOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :payment_id, :integer
  end
end
