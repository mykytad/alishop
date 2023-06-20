# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  u = 0
  while 5 > u
    user = User.create!(
      name: Faker::JapaneseMedia::OnePiece.character,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone_in_e164.to_i,
      password: "123456",
      password_confirmation: "123456"
    )
    u += 1
  end
  puts "users create"

  store = Store.create!(
    name: Faker::Company.name,
    phone: Faker::PhoneNumber.cell_phone_in_e164.to_i,
    description: Faker::Company.catch_phrase,
    user_id: rand(1..5)
  )
  puts "store create"

  c = 0
  categories = ["Pet supplies", "Goods for gamers", "Household products", "Clothes", "Sports and hobbies"]
  while categories.count > c
    categories.each do |item|
      category = Category.create!(
        name: item
      )
      c += 1
    end
  end
  puts "categories create"

  i = 0
  image = File.open("public/product1.png")
  while 10 > i
    Product.create!(
      name: Faker::Coffee.blend_name,
      description: Faker::Coffee.notes,
      price: 600,
      discount: rand(0..15),
      store_id: store.id,
      images: [image],
      category_id: rand(1..5)
    )
    i += 1
  end
  puts "products create"

  r = 0
  while 30 > r
    review = Review.create!(
      body: Faker::Movies::StarWars.quote,
      user_id: rand(1..5),
      product_id: rand(1..10),
      rating: rand(1..5)
    )
    r += 1
  end
  puts "review create"

  puts "success"
end
