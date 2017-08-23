
Wish.destroy_all
User.destroy_all

user = User.create!(
  email: "example@gmail.com",
  password: "password",
  first_name: "John",
  last_name: "Doe",
)



puts "Everything done"






