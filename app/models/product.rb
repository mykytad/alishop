class Product < ApplicationRecord
    belongs_to :user
    belongs_to :store
    has_many :order_products
    has_many :order, through => :order_products
end
