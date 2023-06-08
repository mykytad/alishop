# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  u = 0
  while u <= 4
    user = User.create!(
      name: Faker::JapaneseMedia::OnePiece.character,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone_in_e164.to_i,
      password: "123456",
      password_confirmation: "123456"
    )
    u += 1
  end

  store = Store.create!(
    name: Faker::Company.name,
    phone: Faker::PhoneNumber.cell_phone_in_e164.to_i,
    description: Faker::Company.catch_phrase,
    user_id: rand(1..5)
  )

  i = 0
  image = File.open("public/product1.png")
  while i <= 9
    Product.create!(
      name: Faker::Coffee.blend_name,
      description: Faker::Coffee.notes,
      price: 600,
      discount: rand(0..15),
      store_id: store.id,
      images: [image]
    )
    i += 1
  end

  r = 0
  while r <= 30
    review = Review.create!(
      body: Faker::Movies::StarWars.quote,
      user_id: rand(1..5),
      product_id: rand(1..10)
    )
    r += 1
  end
  puts "success"
end
