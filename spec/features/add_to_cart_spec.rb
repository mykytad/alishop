require "rails_helper"
require "shared_methods"

RSpec.feature "add to cart ", type: :feature do
  it "add product to cart" do
    test_product
    click_link "Buy"

    expect(body).to have_content "Phone"
    expect(body).to have_content "1"
    expect(body).to have_content "950"

    click_link "Add"

    expect(body).to have_content "2"
    expect(body).to have_content "1900"

    click_link "Delete"

    expect(body).to have_content "1"
    expect(body).to have_content "950"
  end

  it "clear cart" do
    test_product
  end
end
