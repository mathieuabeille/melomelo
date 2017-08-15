Cloth.destroy_all

clothes_attributes = [
  {
    name: "Embroid T-Shirt",
    description: "embroid",
    size: "M",
    price: 20,
    color: "white",
    brand: "ZARA",
    material: "cotton",
  },

  {
    name: "Embroid T-Shirt",
    description: "rose",
    size: "M",
    price: 15,
    color: "Beige",
    brand: "H&M",
    material: "cotton",
  },

  {
    name: "T-Shirt",
    description: "embroid",
    size: "M",
    price: 30,
    color: "Beige",
    brand: "ASOS",
    material: "polyester",
  },

  {
    name: "T-Shirt",
    description: "embroid",
    size: "M",
    price:40,
    color: "Beige",
    brand: "AMAZON",
    material: "cotton",
  },

  {
    name: "T-Shirt",
    description: "embroid",
    size: "M",
    price:20,
    color: "white",
    brand: "AMAZON",
    material: "polyester",

  },

  {
    name: "T-Shirt",
    description: "embroid",
    size: "M",
    price:40,
    color: "black",
    brand: "ASOS",
    material: "cotton",

  }
]

puts "Creating Clothes"
Cloth.create!(clothes_attributes)



