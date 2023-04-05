require "rails_helper"
require "shared_methods"

RSpec.feature "checkout form", type: :feature do
  it "visit checkout" do
    test_product
    click_link "Buy"
    click_link "To order"

    expect(body).to have_content "Checkout form"
    expect(body).to have_content "Your cart"
    expect(body).to have_content "Phone"
    expect(body).to have_content "950$"
  end
end
