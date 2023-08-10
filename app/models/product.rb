class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :reviews

  mount_uploaders :images, ImageUploader
  serialize :images # , JSON  If you use SQLite, add this line.

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :discount, presence: true

  def price_with_discount
    price - discount
  end

  def calc_rating
    if reviews.count > 0
      (reviews.sum(:rating).to_f / reviews.count).round(1)
    else
      return 0
    end
  end

  def update_rating
    self.rating = calc_rating
    save
  end

  after_update do
    store.update_rating
  end
end
