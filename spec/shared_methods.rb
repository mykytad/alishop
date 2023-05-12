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

  click_link "Shop"
  click_link "Create a new product"
  fill_in :product_name, with: "Phone"
  fill_in :product_description, with: "color: space grey"
  fill_in :product_price, with: "950"
  fill_in :product_discount, with: "0"
  click_button "Create product"
end
