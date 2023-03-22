class CreateStoreUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :store_users do |t|
      t.integer :user_id
      t.integer :store_id
      t.timestamps
    end
  end
end
