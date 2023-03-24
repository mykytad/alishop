class Store < ApplicationRecord
    has_many :products

    validates :name, presence: true
    validates :description, presence: true
    validates :phone, presence: true
end
