class Store < ApplicationRecord
  has_many :products, :dependent => :destroy
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :phone, presence: true, length: { minimum: 9 }
end
