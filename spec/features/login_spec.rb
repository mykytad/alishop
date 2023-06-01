require "rails_helper"
require "shared_methods"

RSpec.feature "new sesion", type: :feature do
  it "login user" do
    log_in(test_user)

    expect(body).to have_link "Profile"
    expect(body).to have_link "Sign out"
  end
end
