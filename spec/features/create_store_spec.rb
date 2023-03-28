require "rails_helper"

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

  def test_user
    User.create(name: "Tomas", email: "tomas@example.com", phone:"0987654321", password: "111111")
  end

  def log_in(user)
    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: "111111"
    click_button "Log in"
  end

end
