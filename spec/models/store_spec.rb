require 'rails_helper'

RSpec.describe Product, type: :model do
  it "save product review" do
    create_product
    expect(@store.calc_rating).to eq(3.5)
  end

  def create_product
    @user = User.create!(
      name: "Tom",
      phone: "8887777766",
      email: "tom.777@example.test",
      password: "qwerty",
      password_confirmation: "qwerty"
    )
    @store = Store.create!(
      name: "Cactus",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      phone: "8887777766",
      user_id: @user.id
    )
    @product_phone = Product.create!(
      name: "Phone",
      description: "color: green",
      price: "2220",
      discount: "89",
      store_id: @store.id,
      rating: 3
    )
    @product_tablet = Product.create!(
      name: "Tablet",
      description: "color: green",
      price: "222",
      discount: "89",
      store_id: @store.id,
      rating: 4
    )
  end
end
