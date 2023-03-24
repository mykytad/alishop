class Store < ApplicationRecord
    has_many :products

    validates :name, presence: true
    validates :description, presence: true
    validates :phone, presence: true, lenght:{minimum: 10, maximum: 10}
end
