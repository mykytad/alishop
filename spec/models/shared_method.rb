def create_product
  @user = User.create!(
    name: "Tom",
    phone: "0987654321",
    email: "tom.777@example.test",
    password: "111111",
    password_confirmation: "111111"
  )
  @category = Category.create!(
    name: "Clothes"
  )
  @store = Store.create!(
    name: "Cactus",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    phone: "0987654321",
    user_id: @user.id
  )
  @product_phone = Product.create!(
    name: "Phone",
    description: "color: green",
    price: "2220",
    discount: "89",
    store_id: @store.id,
    rating: 3,
    category_id: @category.id
  )
  @product_tablet = Product.create!(
    name: "Tablet",
    description: "color: green",
    price: "222",
    discount: "89",
    store_id: @store.id,
    rating: 4,
    category_id: @category.id
  )
  @product_laptop = Product.create!(
    name: "Laptop",
    description: "color: green",
    price: "222",
    discount: "89",
    store_id: @store.id,
    category_id: @category.id
  )
end
