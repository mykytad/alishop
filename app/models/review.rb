class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  after_create do
    product.update_rating
  end
end
