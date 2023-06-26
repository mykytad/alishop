require "rails_helper"
require "shared_methods"

RSpec.feature "add to cart ", type: :feature do
  before do
    test_product
    visit root_path
  end

  it "add product to cart" do
    click_link "Buy"

    expect(body).to have_content "Phone"
    expect(body).to have_content "1"

    click_link "+"

    expect(body).to have_content "2"

    click_link "-"

    expect(body).to have_content "1"
    expect(body).to have_content "$950.00"
  end

  it "delete product from cart" do
    click_link "Buy"
    click_link "+"
    click_link "delete_all"

    expect(body).to have_content "Your cart is empty"
    expect(body).to have_content "Your cart"
  end

  it "clear cart" do
    click_link "Buy"
    click_link "+"
    click_link "Clear"

    expect(body).to have_content "Your cart"
    expect(body).to have_content "Your cart is empty"
  end
end
