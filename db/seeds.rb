# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  u = 0
  while u < 2
    User.create!(
      name: Faker::JapaneseMedia::OnePiece.character,
      email: Faker::Internet.email,
      phone: 111_111_111,
      password: "123456",
      password_confirmation: "123456"
    )
    u += 1
  end
  user = User.create!(
    name: Faker::JapaneseMedia::OnePiece.character,
    email: Faker::Internet.email,
    phone: 111_111_111,
    password: "123456",
    password_confirmation: "123456"
  )
  puts "users create"

  store = Store.create!(
    name: Faker::Company.name,
    phone: 111_111_111,
    description: Faker::Company.catch_phrase,
    user_id: user.id
  )
  puts "store create"

  c = 0
  categories = ["Pet supplies", "Goods for gamers", "Household products", "Clothes", "Sports and hobbies"]
  while c < categories.count
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
  while i < 10
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
  while r < 30
    review = Review.create!(
      body: Faker::Movies::StarWars.quote,
      user_id: user.id,
      product_id: rand(1..10),
      rating: rand(1..5)
    )
    r += 1
  end
  puts "reviews create"

  o = 0
  while o < 15
    order = Order.create!(
      name: user.name,
      last_name: "Smith",
      email: user.email,
      address: "Landing Lange",
      zip: 4455,
      country: "UA",
      store_id: store.id,
      user_id: user.id,
      sum_price: 40,
      created_at: Time.now - rand(0..7).day,
      updated_at: Time.now - rand(0..7).day
    )
    Payment.create!(
      user_id: user.id,
      order_id: order.id,
      payment_type: "MasterCard/VISA",
      status: true,
      created_at: order.created_at,
      updated_at: order.updated_at
    )
    o += 1
  end
  puts "orders create"
  puts "success"
end
