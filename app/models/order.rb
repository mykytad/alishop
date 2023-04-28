class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  belongs_to :store

  mount_uploader :image, ImageUploader

  validates :zip, presence: true
  validates :email, presence: true
end
