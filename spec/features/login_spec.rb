require "rails_helper"

RSpec.feature "new sesion", type: :feature do
  it "login user" do
    test_user
    visit new_user_session_path
    fill_in :user_email, with: "tomas@example.com"
    fill_in :user_password, with: "111111"
    click_button "Log in"

    expect(body).to have_link "Profile"
    expect(body).to have_link "Setting"
    expect(body).to have_link "Sign out"
  end
end
