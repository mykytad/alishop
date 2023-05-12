require "rails_helper"
require "shared_methods"

RSpec.feature "manager", type: :feature do
  before do
    test_product
    visit root_path
  end

  it "order list" do
    test_order
    expect(body).to have_content "Shop"
    expect(body).to have_content "1"
    click_link "Shop"
    expect(body).to have_content "Shop Orders"
  end
end
