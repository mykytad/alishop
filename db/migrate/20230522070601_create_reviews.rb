class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.timestamps
    end
  end
end
