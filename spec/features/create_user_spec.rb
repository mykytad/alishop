require "rails_helper"

RSpec.feature "create user", type: :feature do

  it "creates a new user" do
    visit new_user_registration_path
    fill_in :user_name, with: "Tom"
    fill_in :user_phone, with: "0987654321"
    fill_in :user_email, with: "tom@example.com"
    fill_in :user_password, with: "111111"
    fill_in :user_password_confirmation, with: "111111"
    click_button "Sign up"
    click_link "Profile"

    expect(body).to have_content "Tom"
    expect(body).to have_link "Sign out"
  end

end
