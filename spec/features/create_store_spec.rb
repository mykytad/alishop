require "rails_helper"
require "shared_methods"

RSpec.feature "create store", type: :feature do
  it "creates a new store" do
    log_in(test_user)
    visit new_store_path
    fill_in :store_name, with: "Shop"
    fill_in :store_description, with: "Shop description"
    fill_in :store_phone, with: "1234567890"
    click_button "Create Store"

    expect(body).to have_content "Shop"
    expect(body).to have_content "Shop description"
    expect(body).to have_content "Create a product"
  end
end
