require "rails_helper"
require "shared_methods"

RSpec.feature "checkout form", type: :feature do
  it "visit checkout" do
    test_product
    visit root_path
    click_link "Buy"
    click_link "Place order"

    expect(body).to have_content "Place an order"
    expect(body).to have_content "Your cart"
    expect(body).to have_content "Phone"
    expect(body).to have_content "950$"
  end

  it "place order" do
    test_product
    visit root_path
    click_link "Buy"
    click_link "Place order"

    expect(body).to have_content "Place an order"
    expect(body).to have_content "Your cart"
    expect(body).to have_content "Phone"
    expect(body).to have_content "950$"

    fill_in :order_name, with: test_user.name
    fill_in :order_last_name, with: "Tomson"
    fill_in :order_email, with: test_user.email
    fill_in :order_address, with: "street"
    fill_in :order_zip, with: "11111"
    select 'Anguilla', from: :order_country
    click_button "Create an order"
  end
end
