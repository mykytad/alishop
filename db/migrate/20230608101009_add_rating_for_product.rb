class AddRatingForProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :rating, :float
  end
end
