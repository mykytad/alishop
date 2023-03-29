class Product < ApplicationRecord
  belongs_to :store
  has_many :order_products
  has_many :orders, through: :order_products

  mount_uploader :image, ImageUploader
end
