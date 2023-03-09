# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "open-uri"

# --------------------------------DESTROYING -------------------------

# Destroying all ItemOccasions
puts "destroying all Itemoccasions"
ItemsOccasion.destroy_all
puts "all ItemOccasions destroyed"

# Destroying all Items
puts "destroying all Items"
Item.destroy_all
puts "all Items destroyed"

# destroying all users
puts "destroying all users"
User.destroy_all
puts "all users destroyed"

#destroy all Occasions
puts "destroying all occasions"
Occasion.destroy_all
puts "all occasions destroyed"

# ------------------------------- CREATE -----------------------------

#Creating users
puts "creating users"
stefany = User.new(first_name: "Stefany", last_name: "Noguera", email: "stefany@gmail.com", password: "password")
stefany.save
puts "created #{User.count} users"

#Creating occasions
puts "creating occasions"
work = Occasion.create(name: "WORK")
night = Occasion.create(name: "NIGHT OUT")
casual = Occasion.create(name: "CASUAL")
gym = Occasion.create(name: "GYM")
puts "created #{Occasion.count} occasion"

#Creating item
puts "creating item"

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

puts "created #{Item.count} items"

# Create Items occasion
puts "creating items occasions"

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

puts "created #{ItemsOccasion.count} occasion"
