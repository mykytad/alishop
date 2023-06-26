require "rails_helper"
require "shared_methods"

RSpec.feature "checkout form", type: :feature do
  before do
    test_product
    visit root_path
  end

  it "place order" do
    click_link "Buy"
    click_link "Place order"

    expect(body).to have_content "Place an order"
    expect(body).to have_content "Your cart"
    expect(body).to have_content "Phone"

    fill_in :order_name, with: test_user.name
    fill_in :order_last_name, with: "Tomson"
    fill_in :order_email, with: test_user.email
    fill_in :order_address, with: "street"
    fill_in :order_zip, with: "11111"
    select 'Anguilla', from: :order_country
    click_button "Create an order"

    expect(body).to have_content "Payment"

    select "MasterCard/VISA", from: :payment_type
    fill_in :credit_card_number, with: "1111222233334444"
    fill_in :expiration, with: "1229"
    fill_in :cvv, with: "2847"
    click_button "Pay"
    expect(body).to have_content "Successful payment"
  end
end
