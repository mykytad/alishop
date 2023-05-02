class Store < ApplicationRecord
  has_many :products, :dependent => :destroy
  has_many :orders
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :phone, presence: true, length: { minimum: 9 }

  def store_new_orders
    orders.where(:status => :new).count
  end
end
