require "rails_helper"
require "shared_methods"

RSpec.feature "manager", type: :feature do
  before do
    test_product
    visit root_path
  end

  it "order status" do
    click_link "Buy"
    click_link "Place order"
    fill_in :name, with: test_user.name
    fill_in :last_name, with: "Holland"
    fill_in :email, with: "tomas@example.com"
    fill_in :address, with: "Munich Central Bus Station"
    fill_in :zip, with: "80335"
    select_in :country, with: "Germany"
    click_link "Place order"


  end
end
