def create_product
  @user = User.create!(
    name: "Tom",
    phone: "8887777766",
    email: "tom.777@example.test",
    password: "qwerty",
    password_confirmation: "qwerty"
  )
  @store = Store.create!(
    name: "Cactus",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    phone: "8887777766",
    user_id: @user.id
  )
  @product_phone = Product.create!(
    name: "Phone",
    description: "color: green",
    price: "2220",
    discount: "89",
    store_id: @store.id,
    rating: 3
  )
  @product_tablet = Product.create!(
    name: "Tablet",
    description: "color: green",
    price: "222",
    discount: "89",
    store_id: @store.id,
    rating: 4
  )
  @product_laptop = Product.create!(
    name: "Laptop",
    description: "color: green",
    price: "222",
    discount: "89",
    store_id: @store.id
  )
end
