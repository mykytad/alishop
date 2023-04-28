class AddForeignKeyForStore < ActiveRecord::Migration[7.0]
  def up
    add_foreign_key :stores, :users, column: :user_id
  end

  def down
    remove_foreign_key :stores, :user_id
  end
end
