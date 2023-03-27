class StoreUser < ApplicationRecord
  has_many :store_users
  has_many :users, through: :store_users
  belongs_to :user
  belongs_to :store
end
