require 'rails_helper'
require 'models/shared_method'

RSpec.describe Product, type: :model do
  it "leave review" do
    create_product
    
    Review.create!(
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      product_id: @product_laptop.id,
      user_id: @user.id,
      rating: 4
    )
    Review.create!(
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      product_id: @product_laptop.id,
      user_id: @user.id,
      rating: 3
    )

    expect(@product_laptop.calc_rating).to eq(3.5)
  end

  it "no review" do
    create_product

    expect(@product_laptop.calc_rating).to eq(0)
  end
end
