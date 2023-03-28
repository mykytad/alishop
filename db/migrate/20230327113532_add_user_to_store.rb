class AddUserToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :user_id, :integer
  end
end
