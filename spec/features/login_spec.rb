require "rails_helper"
require "shared_methods"

RSpec.feature "new sesion", type: :feature do
  it "login user" do
    log_in(test_user)

    expect(body).to have_link "Tom"
    expect(body).to have_link "Sign out"
  end
end
