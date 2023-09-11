class Store < ApplicationRecord
  include Elasticsearch::Model

  has_many :products, :dependent => :destroy
  has_many :orders
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :phone, presence: true, length: { minimum: 9 }

  def store_new_orders
    orders.where(:status => :new).count
  end

  def calc_rating
    if products.count > 0
      (products.sum(:rating) / products.count).round(1)
    else
      return 0
    end
  end

  def update_rating
    self.rating = calc_rating
    save
  end
end
