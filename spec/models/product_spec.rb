require 'rails_helper'

RSpec.describe Product, type: :model do
  it "leave review" do
    create_product
    Review.create!(
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      product_id: @product.id,
      user_id: @user.id,
      rating: 3
    )
    Review.create!(
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      product_id: @product.id,
      user_id: @user.id,
      rating: 4
    )

    expect(@product.calc_rating).to eq(3.5)
  end

  it "no review" do
    create_product

    expect(@product.calc_rating).to eq(0)
  end

  def create_product
    @user = User.create!(
      name: "Tom",
      phone: "8887777766",
      email: "tom.777@example.test",
      password: "qwerty",
      password_confirmation: "qwerty"
    )
    store = Store.create!(
      name: "Cactus",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      phone: "8887777766",
      user_id: @user.id
    )
    @product = Product.create!(
      name: "Phone",
      description: "color: green",
      price: "2220",
      discount: "89",
      store_id: store.id
    )
  end
end
