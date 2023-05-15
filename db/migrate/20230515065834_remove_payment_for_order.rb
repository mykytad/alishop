class RemovePaymentForOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :payment_id
  end
end
