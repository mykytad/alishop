class Product < ApplicationRecord
  belongs_to :store
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :discount, presence: true

  def price_with_discount
    price - discount
  end
end
