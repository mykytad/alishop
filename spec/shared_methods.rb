def test_user
  User.create(
    name: "Tomas",
    email: "tomas@example.com",
    phone: "0987654321",
    password: "111111"
  )
end

def log_in(user)
  visit new_user_session_path
  fill_in :user_email, with: user.email
  fill_in :user_password, with: "111111"
  click_button "Log in"
end

def test_store
  visit new_store_path
  fill_in :store_name, with: "Shop"
  fill_in :store_description, with: "Shop description"
  fill_in :store_phone, with: "1234567890"
  click_button "Create store"
end

def test_product
  log_in(test_user)
  test_store
  save_and_open_page
  click_link "Create a new product"
  fill_in :product_name, with: "Phone"
  fill_in :product_description, with: "color: space grey"
  fill_in :product_price, with: "950"
  fill_in :product_discount, with: "0"
  click_button "Create product"
end

def test_order
  click_link "Buy"
  click_link "Place order"

  fill_in :order_name, with: test_user.name
  fill_in :order_last_name, with: "Tomson"
  fill_in :order_email, with: test_user.email
  fill_in :order_address, with: "street"
  fill_in :order_zip, with: "11111"
  select 'Anguilla', from: :order_country
  click_button "Create an order"

  select "MasterCard/VISA", from: :payment_type
  fill_in :credit_card_number, with: "1111222233334444"
  fill_in :expiration, with: "1229"
  fill_in :cvv, with: "2847"
  click_button "Pay"
end
