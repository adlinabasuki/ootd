# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

# --------------------------------DESTROYING -------------------------
# Destroying all ItemsWeather
puts "destroying all ItemsWeather"
ItemsWeather.destroy_all
puts "all ItemsWeather destroyed"

# Destroying all OutfitsItems
puts "destroying all OutfitsItems"
OutfitsItem.destroy_all
puts "all OutfitsItems destroyed"

# Destroying all Outfits
puts "destroying all Outfits"
Outfit.destroy_all
puts "all Outfits destroyed"

# Destroying all ItemOccasions
puts "destroying all Itemoccasions"
ItemsOccasion.destroy_all
puts "all ItemOccasions destroyed"

# Destroying all Items
puts "destroying all Items"
Item.destroy_all
puts "all Items destroyed"

# Destroying all users
puts "destroying all users"
User.destroy_all
puts "all users destroyed"

# Destroy all Occasions
puts "destroying all occasions"
Occasion.destroy_all
puts "all occasions destroyed"

# ------------------------------- CREATE -----------------------------

# Creating users
puts "creating users"
stefany = User.new(first_name: "Stefany", last_name: "Noguera", email: "stefany@gmail.com", password: "password")
stefany.save
julia = User.new(first_name: "Julia", last_name: "Thuden", email: "julia@gmail.com", password: "password")
julia.save
puts "created #{User.count} users"

# Creating occasions
puts "creating occasions"
work = Occasion.create(name: "WORK")
night = Occasion.create(name: "NIGHT OUT")
casual = Occasion.create(name: "CASUAL")
gym = Occasion.create(name: "GYM")
puts "created #{Occasion.count} occasion"

# Creating item
puts "creating item"

# Items for Stefany
file = URI.open("https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
item_one = Item.new(name: "Jeans", type: "BOTTOM", user: stefany)
item_one.photo.attach(io: file, filename: "item_one.png", content_type: "image/png")
item_one.save

file = URI.open("https://plus.unsplash.com/premium_photo-1671149028241-8e25ffee90dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80")
item_two = Item.new(name: "Skirt", type: "BOTTOM", user: stefany)
item_two.photo.attach(io: file, filename: "item_two.png", content_type: "image/png")
item_two.save

file = URI.open("https://images.unsplash.com/photo-1596755094514-f87e34085b2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80")
item_three = Item.new(name: "Shirt", type: "TOP", user: stefany)
item_three.photo.attach(io: file, filename: "item_three.png", content_type: "image/png")
item_three.save

file = URI.open("https://images.unsplash.com/photo-1631541909061-71e349d1f203?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1005&q=80")
item_four = Item.new(name: "Sweater", type: "TOP", user: stefany)
item_four.photo.attach(io: file, filename: "item_four.png", content_type: "image/png")
item_four.save

file = URI.open("https://images.unsplash.com/photo-1515347619252-60a4bf4fff4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2385&q=80")
item_five = Item.new(name: "Heels", type: "SHOE", user: stefany)
item_five.photo.attach(io: file, filename: "item_five.png", content_type: "image/png")
item_five.save

file = URI.open("https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2312&q=80")
item_six = Item.new(name: "Sneakers", type: "SHOE", user: stefany)
item_six.photo.attach(io: file, filename: "item_six.png", content_type: "image/png")
item_six.save

file = URI.open("https://images.unsplash.com/photo-1591195853828-11db59a44f6b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80")
item_seven = Item.new(name: "Jeans Shorts", type: "BOTTOM", user: stefany)
item_seven.photo.attach(io: file, filename: "item_seven.png", content_type: "image/png")
item_seven.save

file = URI.open("https://images.unsplash.com/photo-1602573991155-21f0143bb45c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1314&q=80")
item_eight = Item.new(name: "Jogger", type: "BOTTOM", user: stefany)
item_eight.photo.attach(io: file, filename: "item_eight.png", content_type: "image/png")
item_eight.save

file = URI.open("https://images.unsplash.com/photo-1618248945468-e07f3e70cdf6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80")
item_nine = Item.new(name: "Tank Top", type: "TOP", user: stefany)
item_nine.photo.attach(io: file, filename: "item_nine.png", content_type: "image/png")
item_nine.save

file = URI.open("https://images.unsplash.com/photo-1603487742131-4160ec999306?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
item_ten = Item.new(name: "Birkenstock", type: "SHOE", user: stefany)
item_ten.photo.attach(io: file, filename: "item_ten.png", content_type: "image/png")
item_ten.save

file = URI.open("https://images.unsplash.com/photo-1603145733190-59811e523c72?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540&q=80")
item_eleven = Item.new(name: "Crocs", type: "SHOE", user: stefany)
item_eleven.photo.attach(io: file, filename: "item_eleven.png", content_type: "image/png")
item_eleven.save

# Items for Julia
file = URI.open("https://images.unsplash.com/photo-1554568218-0f1715e72254?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
item_twelve = Item.new(name: "White T-shirt", type: "TOP", user: julia)
item_twelve.photo.attach(io: file, filename: "item_twelve.png", content_type: "image/png")
item_twelve.save

file = URI.open("https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
item_thirteen = Item.new(name: "Fav Jeans", type: "BOTTOM", user: julia)
item_thirteen.photo.attach(io: file, filename: "item_thirteen.png", content_type: "image/png")
item_thirteen.save

file = URI.open("https://plus.unsplash.com/premium_photo-1671149028241-8e25ffee90dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80")
item_fourteen = Item.new(name: "Black and white skirt", type: "BOTTOM", user: julia)
item_fourteen.photo.attach(io: file, filename: "item_fourteen.png", content_type: "image/png")
item_fourteen.save

file = URI.open("https://images.unsplash.com/photo-1596755094514-f87e34085b2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80")
item_fifteen = Item.new(name: "Shirt with spots", type: "TOP", user: julia)
item_fifteen.photo.attach(io: file, filename: "item_fifteen.png", content_type: "image/png")
item_fifteen.save

file = URI.open("https://images.unsplash.com/photo-1603145733190-59811e523c72?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540&q=80")
item_sixteen = Item.new(name: "Julia's shoes", type: "SHOE", user: julia)
item_sixteen.photo.attach(io: file, filename: "item_sixteen.png", content_type: "image/png")
item_sixteen.save

puts "created #{Item.count} items"

# Create Items occasion
puts "creating items occasions"

# Item occasions for Stefany
ItemsOccasion.create(
  item_id: item_one.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_one.id,
  occasion_id: night.id
)

ItemsOccasion.create(
  item_id: item_two.id,
  occasion_id: work.id
)

ItemsOccasion.create(
  item_id: item_three.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_three.id,
  occasion_id: work.id
)

ItemsOccasion.create(
  item_id: item_four.id,
  occasion_id: night.id
)

ItemsOccasion.create(
  item_id: item_four.id,
  occasion_id: work.id
)

ItemsOccasion.create(
  item_id: item_four.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_five.id,
  occasion_id: work.id
)

ItemsOccasion.create(
  item_id: item_five.id,
  occasion_id: night.id
)

ItemsOccasion.create(
  item_id: item_six.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_six.id,
  occasion_id: gym.id
)

ItemsOccasion.create(
  item_id: item_seven.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_eight.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_nine.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_nine.id,
  occasion_id: gym.id
)

ItemsOccasion.create(
  item_id: item_ten.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_eleven.id,
  occasion_id: casual.id
)

# Item occasions for Julia
ItemsOccasion.create(
  item_id: item_twelve.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_twelve.id,
  occasion_id: work.id
)

ItemsOccasion.create(
  item_id: item_thirteen.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_fourteen.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_fourteen.id,
  occasion_id: work.id
)

ItemsOccasion.create(
  item_id: item_fourteen.id,
  occasion_id: night.id
)

ItemsOccasion.create(
  item_id: item_fifteen.id,
  occasion_id: work.id
)

ItemsOccasion.create(
  item_id: item_fifteen.id,
  occasion_id: casual.id
)

ItemsOccasion.create(
  item_id: item_sixteen.id,
  occasion_id: work.id
)

puts "created #{ItemsOccasion.count} Items occasion"

# Creating ItemsWeather (for Stefany's Items)
puts "creating ItemsWeather"

ItemsWeather.create(
  item_id: item_one.id,
  name: "rainy and cold"
)

ItemsWeather.create(
  item_id: item_one.id,
  name: "dry and cold"
)

ItemsWeather.create(
  item_id: item_two.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_two.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_three.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_three.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_three.id,
  name: "dry and medium warm"
)

ItemsWeather.create(
  item_id: item_three.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_three.id,
  name: "rainy and medium warm"
)

ItemsWeather.create(
  item_id: item_four.id,
  name: "dry and cold"
)

ItemsWeather.create(
  item_id: item_four.id,
  name: "rainy and cold"
)

ItemsWeather.create(
  item_id: item_four.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_five.id,
  name: "dry and medium warm"
)

ItemsWeather.create(
  item_id: item_five.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_five.id,
  name: "dry and cold"
)

ItemsWeather.create(
  item_id: item_six.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_six.id,
  name: "dry and medium warm"
)

ItemsWeather.create(
  item_id: item_six.id,
  name: "dry and cold"
)

ItemsWeather.create(
  item_id: item_six.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_six.id,
  name: "rainy and medium warm"
)

ItemsWeather.create(
  item_id: item_six.id,
  name: "rainy and cold"
)

ItemsWeather.create(
  item_id: item_seven.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_seven.id,
  name: "dry and medium warm"
)

ItemsWeather.create(
  item_id: item_seven.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_seven.id,
  name: "rainy and medium warm"
)

ItemsWeather.create(
  item_id: item_eight.id,
  name: "dry and cold"
)

ItemsWeather.create(
  item_id: item_eight.id,
  name: "rainy and cold"
)

ItemsWeather.create(
  item_id: item_eight.id,
  name: "rainy and medium warm"
)

ItemsWeather.create(
  item_id: item_nine.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_nine.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_ten.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_ten.id,
  name: "dry and medium warm"
)

ItemsWeather.create(
  item_id: item_ten.id,
  name: "dry and cold"
)

ItemsWeather.create(
  item_id: item_eleven.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_eleven.id,
  name: "dry and medium warm"
)

ItemsWeather.create(
  item_id: item_eleven.id,
  name: "dry and cold"
)

ItemsWeather.create(
  item_id: item_eleven.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_eleven.id,
  name: "rainy and medium warm"
)

ItemsWeather.create(
  item_id: item_eleven.id,
  name: "rainy and cold"
)

ItemsWeather.create(
  item_id: item_twelve.id,
  name: "dry and hot"
)

ItemsWeather.create(
  item_id: item_twelve.id,
  name: "dry and medium warm"
)

ItemsWeather.create(
  item_id: item_twelve.id,
  name: "rainy and hot"
)

ItemsWeather.create(
  item_id: item_twelve.id,
  name: "rainy and medium warm"
)

ItemsWeather.create(
  item_id: item_thirteen.id,
  name: "dry and hot"
)
puts "created #{ItemsWeather.count} ItemsWeather"
