require "rails_helper"
require "shared_methods"

RSpec.feature "manager", type: :feature do
  before do
    test_product
    visit root_path
  end

  # it "order status" do
  # end
end
