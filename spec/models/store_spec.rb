require 'rails_helper'
require 'models/shared_method'

RSpec.describe Product, type: :model do
  it "save product review" do
    create_product
    expect(@store.calc_rating).to eq(2.3)
  end
end
