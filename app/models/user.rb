class User < ApplicationRecord
    has_many :store_users
    has_many :store, through: :store_users
    has_many :product
    has_many :order
end
