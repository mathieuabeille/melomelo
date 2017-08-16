User.destroy_all
Cloth.destroy_all

user = User.create!(
  email: "example@gmail.com",
  password: "password",
  first_name: "John",
  last_name: "Doe"
)

cloth = Cloth.create!(
  name: "Embroid T-Shirt",
  description: "embroid",
  sizes: "M",
  price: 20,
  color: "white",
  brand: "ZARA",
  material: "cotton",
)

Basket.create!(
  user: user,
  cloth: cloth
)

cloth = Cloth.create!(
  name: "Embroid T-Shirt",
  description: "rose",
  sizes: "M",
  price: 15,
  color: "Beige",
  brand: "H&M",
  material: "cotton",
)

Basket.create!(
  user: user,
  cloth: cloth
)

cloth = Cloth.create!(
  name: "T-Shirt",
  description: "embroid",
  sizes: "M",
  price: 30,
  color: "Beige",
  brand: "ASOS",
  material: "polyester",
)
Basket.create!(
  user: user,
  cloth: cloth
)
cloth = Cloth.create!(
  name: "T-Shirt",
  description: "embroid",
  sizes: "M",
  price:40,
  color: "Beige",
  brand: "AMAZON",
  material: "cotton",
)
Basket.create!(
  user: user,
  cloth: cloth
)

cloth = Cloth.create!(
  name: "T-Shirt",
  description: "embroid",
  sizes: "M",
  price:20,
  color: "white",
  brand: "AMAZON",
  material: "polyester",
)
Basket.create!(
  user: user,
  cloth: cloth
)
cloth = Cloth.create!(
  name: "T-Shirt",
  description: "embroid",
  sizes: "M",
  price:40,
  color: "black",
  brand: "ASOS",
  material: "cotton",
)

Basket.create!(
  user: user,
  cloth: cloth
)



puts "Everything done"





