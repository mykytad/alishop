class AddRatingForStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :rating, :float
  end
end
