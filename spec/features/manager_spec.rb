require "rails_helper"
require "shared_methods"

RSpec.feature "manager", type: :feature do
  before do
    test_product
    visit root_path
    test_order
  end

  it "order list" do
    expect(body).to have_content "Shop"
    expect(body).to have_content "1"
    save_and_open_page
    visit manager_store_orders_path(1)
    expect(body).to have_content "Shop Orders"
    expect(body).to have_content "new"
    expect(body).to have_content test_user.email
  end

  it "order show" do
    click_link :store_link
    click_link "more_link"

    expect(body).to have_content "Order №1"
    expect(body).to have_content "paid"
  end

  it "change order" do
    visit manager_store_orders_path(1)
    click_link "more_link"
    select "completed", from: :order_status

    expect(body).to have_content "Status"
    expect(body).to have_content "completed"
  end
end
