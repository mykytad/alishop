class AddRatingForReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :rating, :intager
  end
end
