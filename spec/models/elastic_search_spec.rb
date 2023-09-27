require "rails_helper"
require "shared_methods"

RSpec.feature "checkout form", type: :feature do
  before do
    test_product
    visit root_path
  end

  describe Product, search: true do
    it "searches" do
      Product.reindex
      assert_equal ["Phone"], Product.search("phone").map(&:name)
    end
  end
end
