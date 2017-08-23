
Wish.destroy_all
User.destroy_all

user = User.create!(
  email: "example@gmail.com",
  password: "password",
  first_name: "John",
  last_name: "Doe",
)

wishes_attributes = [
  {
    name: "T-Shirt",
    price: "20",
    color:"blue",
    gender: "man",
    material: "Coton",
    user: user
  },

  {
    price: "60",
    color:"black",
    gender: "women",
    name: "Dress",
    material: "linen",
    user: user
  },


  {
    price: "100",
    color:"blue",
    gender: "women",
    name: "jeans",
    description: "embroid",
    user: user
  },
]


puts "Everything done"
Wish.create!(wishes_attributes)





