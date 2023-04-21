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
    expect(body).to have_content "Shop description"
    expect(body).to have_content "Create a product"
  end

  it "creates a new store and product" do
    log_in(test_user)
    test_store

    click_link "Create a product"
    fill_in :product_name, with: "Phone"
    fill_in :product_description, with: "color: space grey"
    fill_in :product_price, with: "950"
    fill_in :product_discount, with: "0"
    click_button "Create product"

    expect(body).to have_content "Phone"
    expect(body).to have_content "color: space grey"
    expect(body).to have_content "950$"
  end

  it "edit product" do
    test_product

    click_link "Edit"
    fill_in :product_discount, with: "50"
    click_button "Create product"

    expect(body).to have_content "Phone"
    expect(body).to have_content "color: space grey"
    expect(body).to have_content "900$"
  end
end
