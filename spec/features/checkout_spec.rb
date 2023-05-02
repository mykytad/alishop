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
end
