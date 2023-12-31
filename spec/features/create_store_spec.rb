require "rails_helper"
require "shared_methods"

RSpec.feature "create store", type: :feature do
  it "creates a new store" do
    log_in(test_user)
    visit new_store_path
    fill_in :store_name, with: "Shop"
    fill_in :store_description, with: "Shop description"
    fill_in :store_phone, with: "1234567890"
    click_button "Create store"

    expect(body).to have_content "Shop"
    expect(body).to have_content "Shop Orders"
    expect(body).to have_link "Edit store"
  end

  it "creates a new product" do
    Category.create!(name: "Pet supplies")
    log_in(test_user)
    test_store

    click_link "Create a new product"
    fill_in :product_name, with: "Phone"
    fill_in :product_description, with: "color: space grey"
    fill_in :product_price, with: "950"
    fill_in :product_discount, with: "0"
    select "Pet supplies", from: :product_category
    click_button "Create product"

    expect(body).to have_content "Phone"
    expect(body).to have_content "950"
  end

  it "edit product" do
    test_product

    click_link "Edit"
    fill_in :product_discount, with: "50"
    select "Pet supplies", from: :product_category
    click_button "Create product"

    expect(body).to have_content "Phone"
    expect(body).to have_content "900"
  end

  it "leave review" do
    test_product
    visit root_path
    click_link "product-cart"
    fill_in :review_body, with: "Lorem ipsum dolor sit amet"
    select "4", from: :review_rating
    click_button "Leave review"

    expect(body).to have_content "Tomas"
    expect(body).to have_content "Lorem ipsum dolor sit amet"
    expect(body).to have_content "4.0"
  end
end
